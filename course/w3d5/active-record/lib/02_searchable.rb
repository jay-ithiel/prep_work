require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable

  def where(params)
    # ...
    param_vals = params.values
    param_cols = params.keys

    where_params = []
    param_cols.map do |col|
      where_params << "#{col} = ?"
    end
    where_params


    results = DBConnection.execute(<<-SQL, *param_vals)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_params.join(' AND ')}
    SQL

    results.map { |hash| self.new(hash) }
  end

end



# Let's write a module named Searchable which will add the ability to search
# using ::where. By using extend, we can mix in Searchable to our SQLObject
# class, adding all the module methods as class methods.
#
# So let's write Searchable#where(params). Here's an example:
#
# haskell_cats = Cat.where(:name => "Haskell", :color => "calico")
# # SELECT
# #   *
# # FROM
# #   cats
# # WHERE
# #   name = ? AND color = ?
# I used a local variable where_line where I mapped the keys of the params to
# "#{key} = ?" and joined with AND.
#
# To fill in the question marks, I used the values of the params object.


class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
