require_relative 'questions_database'
require_relative 'question'
require_relative 'user'


class QuestionFollow

  attr_reader :id , :user_id, :question_id
  def self.followers_for_question_id(question_id)
    follow_data = QuestionsDatabase.execute(<<-SQL, question_id: question_id )
          SELECT
            users.*
          FROM
            questions
          JOIN
            question_follows ON users.id = question_follows.user_id

          WHERE
            question_follows.question_id = :question_id
          SQL

       follow_data.map { |follow| Users.new(follow)}
  end

  def self.followed_questions_for_user_id(user_id)
    question_data = QuestionsDatabase.execute(<<-SQL, user_id: user_id )
    SELECT
      questions.*
    FROM
      questions
    JOIN
      question_follows ON questions.id = question_follows.question_id
    WHERE
      question_follows.user_id = :user_id
    SQL

    question_data.map { |question| Question.new(question)}
  end

  
end
