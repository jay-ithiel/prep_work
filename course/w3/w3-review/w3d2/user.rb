require_relative 'questions_db'
require 'byebug'

# For each class, add a class method find_by_id which will lookup an id in the table, and return an object representing that row. For example, our Question::find_by_id should return an instance of our Question class! 
# We'll add additional query class methods as needed. For instance, the user class will have User::find_by_name(fname, lname).
# Your initialize method should take an options hash of attributes and construct an object wrapping that data. We do this because the DB query return value is an array of hashes in exactly this format.
# Add attribute accessors to access the instance variables of our new classes. These instance variables have now been populated with the data from the database.


class User

  def self.find_by_id(id)
    user = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id = ?
    SQL
    raise 'User does not exist in database' if user.empty?

    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        users.fname = ? AND users.lname = ?
    SQL
    raise 'User does not exist in database' if user.empty?

    User.new(user.first)
  end

  attr_reader :id
  attr_accessor :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
end
