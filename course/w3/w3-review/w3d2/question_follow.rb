require_relative 'questions_db'

# For each class, add a class method find_by_id which will lookup an id in the table, and return an object representing that row. For example, our Question::find_by_id should return an instance of our Question class!
# We'll add additional query class methods as needed. For instance, the user class will have User::find_by_name(fname, lname).
# Your initialize method should take an options hash of attributes and construct an object wrapping that data. We do this because the DB query return value is an array of hashes in exactly this format.
# Add attribute accessors to access the instance variables of our new classes. These instance variables have now been populated with the data from the database.

class QuestionFollow

  def self.find_by_id(id)
    question_follow = Question.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_follows.id = ?
    SQL
    raise 'no matching records' if question_follow.empty?

    QuestionFollow.new(question_follow.first)
  end

  attr_reader :id
  attr_accessor :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
