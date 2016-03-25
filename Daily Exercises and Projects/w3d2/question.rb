require_relative 'questions_database'

class Question
  attr_reader :id
  attr_accessor :title, :body, :author_id

  def initialize(options = {})
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']

  end

  def self.find_by_author_id(author_id)
    question_data = QuestionsDatabase.execute(<<-SQL, author_id: author_id)
      SELECT
        *
      FROM
        questions
      WHERE
      questions.author_id = :author_id
    SQL

    question_data..map { |question_data| Question.new(question_data)}
  end

  def self.find(id)
    question_data = QuestionsDatabase.instance.get_first_row(<<-SQL, id: id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.id = :id
    SQL

    question_data.nil? ? nil : Question.new(question_data)
  end


  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def author
    Users.find_by_id(@author_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end
end
