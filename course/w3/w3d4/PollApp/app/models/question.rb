class Question < ActiveRecord::Base
  validates :question, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses

  # def n_plus_one_results
  #   answers = self.answer_choices
  #   answers_count = Hash.new(0)
  #
  #   answers.each do |answer|
  #     answers_count[answer.answer] = answer.responses.count
  #   end
  #
  #   answers_count
  # end
  #
  # def prefetch_results
  #   answers = self.answer_choices.includes(:responses)
  #   answers_count = {}
  #
  #   answers.each do |answer|
  #     answers_count[answer.answer] = answer.responses.length
  #   end
  # end

  def best_results
    # self
    #   .joins(:answer_choices)
    #   .left_outer_joins(:responses)
    #   .where("answer_choices.question_id = questions.id")
    #   .group("answer_choices.answer")
    #   .select("answer_choices.*, COUNT(*)")

    AnswerChoice.find_by_sql(<<-SQL)
    SELECT
      answer_choices.id,
      answer_choices.answer,
      COUNT(*) as num_responses
    FROM
      answer_choices
    LEFT OUTER JOIN
      responses ON responses.answer_choice_id = answer_choices.id
    WHERE
      answer_choices.question_id = #{self.id}
    GROUP BY
      answer_choices.answer,
      answer_choices.id
    SQL
  end

end
