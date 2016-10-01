require 'byebug'
require 'questions_db'

# For each class, add a class method find_by_id which will lookup an id in the table, and return an object representing that row. For example, our Question::find_by_id should return an instance of our Question class!
# We'll add additional query class methods as needed. For instance, the user class will have User::find_by_name(fname, lname).
# Your initialize method should take an options hash of attributes and construct an object wrapping that data. We do this because the DB query return value is an array of hashes in exactly this format.
# Add attribute accessors to access the instance variables of our new classes. These instance variables have now been populated with the data from the database.

class Question
  def self.find_by_id(id)
    question = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.id = ?
    SQL
    raise 'No questions by that id exists in database' if question.empty?

    Question.new(question)
  end

  def self.find_by_name(title)
    question = QuestionsDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.title = ?
    SQL
    raise 'No questions match that title' if question.empty?

    Question.new(question)
  end

  attr_reader :id
  attr_accessor :title, :body, :author_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end
end
