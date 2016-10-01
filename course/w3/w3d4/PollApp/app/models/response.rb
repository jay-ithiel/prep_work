class Response < ActiveRecord::Base

  validate :respondent_already_answered?
  validate :author_responding?

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :respondent_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    if sibling_responses.exists?(respondent_id: self.respondent_id)
      self.errors[:response] << 'already responded'
    end
  end

  def author_responding?
    if self.answer_choice.question.poll.author_id == self.respondent_id
      self.errors[:author] << 'can\'t rig'
    end
  end

end
