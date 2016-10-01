# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do

  jay = User.create(username: "jay")
  cindy = User.create(username: "cindy")
  hwang = User.create(username: "hwang")
  wang = User.create(username: "wang")

  Poll.create(title: "Poll 1", author_id: 1)
  Poll.create(title: "Poll 2", author_id: 2)
  Poll.create(title: "Poll 3", author_id: 3)

  Question.create(question: "How many days in a year?", poll_id: 1)
  Question.create(question: "What did you have for lunch?", poll_id: 2)
  Question.create(question: "Where are you from?", poll_id: 3)


  AnswerChoice.create(answer: "365", question_id: 1)
  AnswerChoice.create(answer: "10000", question_id: 1)
  AnswerChoice.create(answer: "30", question_id: 1)

  AnswerChoice.create(answer: "food", question_id: 2)
  AnswerChoice.create(answer: "ice cream", question_id: 2)
  AnswerChoice.create(answer: "indian", question_id: 2)

  AnswerChoice.create(answer: "STL", question_id: 3)
  AnswerChoice.create(answer: "LA", question_id: 3)
  AnswerChoice.create(answer: "NY", question_id: 3)


  Response.create(answer_choice_id: 3, respondent_id: 1)
  Response.create(answer_choice_id: 4, respondent_id: 1)
  Response.create(answer_choice_id: 7, respondent_id: 1)

  Response.create(answer_choice_id: 2, respondent_id: 2)
  Response.create(answer_choice_id: 4, respondent_id: 2)
  Response.create(answer_choice_id: 6, respondent_id: 2)

  Response.create(answer_choice_id: 1, respondent_id: 3)
  Response.create(answer_choice_id: 4, respondent_id: 3)
  Response.create(answer_choice_id: 9, respondent_id: 3)

  Response.create(answer_choice_id: 1, respondent_id: 4)
  Response.create(answer_choice_id: 5, respondent_id: 4)
  Response.create(answer_choice_id: 8, respondent_id: 4)

end
