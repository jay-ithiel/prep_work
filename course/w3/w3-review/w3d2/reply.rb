require_relative 'questions_db'

class Reply

  def self.find_by_id(id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.id = ?
    SQL
    raise 'No matching records' if reply.empty?

    Reply.new(reply)
  end

  attr_reader :id
  attr_accessor :body, :question_id, :parent_id, :author_id

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @author_id = options['author_id']
  end

end
