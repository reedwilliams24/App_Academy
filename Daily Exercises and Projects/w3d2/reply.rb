require_relative 'questions_database'

class Reply

  attr_reader :id
  attr_accessor :question_id, :parent_reply_id, :author_id, :body

  def initialize(options= {})
    @id = options['id']
    @question_id = options['question_id']
    @body = options['body']
    @author_id = options['author_id']
    @parent_reply_id = options['parent_reply_id']
  end

  def find_by_user_id(user_id)
    reply_data = QuestionsDatabase.execute(<<-SQL, user_id: user_id)
      SELECT
        *
      FROM
        replies
      WHERE
      replies.author_id = :user_id
    SQL

    reply_data.map { |reply| Reply.new(reply)}

  end

  def find_by_question_id(question_id)
    reply_data = QuestionsDatabase.execute(<<-SQL, question_id: question_id)
      SELECT
        *
      FROM
        replies
      WHERE
      replies.question_id = :question_id
    SQL

    reply_data.map { |reply| Reply.new(reply)}

  end

  def self.find(id)
    reply_data = QuestionsDatabase.instance.get_first_row(<<-SQL, id: id)
         SELECT
           *
         FROM
           replies
         WHERE
           replies.id = :id
       SQL

       reply_data.nil? ? nil : Reply.new(reply_data)
     end
  end

  def self.find_by_parent_id(parent_id)
    reply_data = QuestionsDatabase.instance.get_first_row(<<-SQL, parent_reply_id: parent_id)
         SELECT
           *
         FROM
           replies
         WHERE
           replies.parent_reply_id= :parent_reply_id
       SQL

       replies_data.map { |reply_data| Reply.new(reply_data)}
     end
  end

  def author
    Users.find_by_id(@author_id)
  end

  def question
    Question.find(@question_id)
  end

  def parent_reply
    Reply.find(@parent_reply_id)
  end

  def child_replies
    Reply.find_by_parent_id(@id)
  end


end
