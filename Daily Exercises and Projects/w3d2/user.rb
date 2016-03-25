require_relative 'questions_database'

class Users

  attr_reader :id
  attr_accessor :fname, :lname

  def initialize(options = {})
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def attrs
    { fname: fname, lname: lname }
  end

  def save
    if @id
      QuestionsDatabase.execute(<<-SQL, attrs.merge({ id: id }))
        UPDATE
          users
        SET
          fname = :fname, lname = :lname
        WHERE
          users.id = :id
      SQL
    else
      QuestionsDatabase.execute(<<-SQL, attrs)
        INSERT INTO
          users (fname, lname)
        VALUES
          (:fname, :lname)
      SQL

      @id = QuestionsDatabase.last_insert_row_id
    end
    self
  end

  def self.find_by_id(id)
    user_data = QuestionsDatabase.instance.get_first_row(<<-SQL, id: id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id = :id
    SQL

    user_data.nil? ? nil : Users.new(user_data)
  end

  def self.find_by_name(fname, lname)
    user_data = QuestionsDatabase.instance.get_first_row(<<-SQL, fname: fname, lname: lname)

    SELECT
      *
    FROM
      users
    WHERE
      users.fname = :fname AND users.lname = :lname
    SQL

    user_data.nil? ? nil : Users.new(user_data)
  end


  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

end
