require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'

# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    # ...
    @column_hash ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    @column_hash.first.map { |column| column.to_sym }
  end

  def self.finalize!
    columns = self.columns

    columns.each do |column|
      define_method("#{column}") do
        attributes[column]
      end

      define_method("#{column}=") do |arg|
        attributes[column] = arg
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= "#{self}".tableize
  end

  def self.all
    # ...
    all = DBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    self.parse_all(all)
  end

  def self.parse_all(results)
    # ...
    results.map { |hash| self.new(hash) }
  end

  def self.find(id)
    # ...
    self.all.select do |obj|
      return obj if obj.id == id
    end
    nil
  end

  def initialize(params = {})
    # ...
    params.each do |name, value|
      sym_name = name.to_sym
      unless self.class.columns.include?(sym_name)
        raise "unknown attribute '#{name}'"
      else
        self.send("#{name}=", value)
      end
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    attributes.values
  end

  def insert
    # ...
    columns = attributes.keys
    vals = attributes.values
    ques = Array.new(vals.count, '?')

    DBConnection.execute(<<-SQL, *vals)
      INSERT INTO
        #{self.class.table_name} (#{columns.join(', ')})
      VALUES
        (#{ques.join(', ')})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    columns = attributes.keys
    vals = attributes.values

    new_vals = []
    columns.each_index do |i|
      new_vals << "#{columns[i]} = ?"
    end

    DBConnection.execute(<<-SQL, *vals, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{new_vals.join(',')}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    # ...
    self.id.nil? ? insert : update
  end
end
