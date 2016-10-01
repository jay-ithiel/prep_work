require_relative 'questions_db'

class QuestionLike

  def self.find_by_id(id)
    question_like = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        question_likes.id = ?
    SQL
    raise 'No matching records' if question_like.empty?

    QuestionLike.new(question_like)
  end

  attr_reader :id
  attr_accessor :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
