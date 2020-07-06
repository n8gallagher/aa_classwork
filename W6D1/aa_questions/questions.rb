require 'sqlite3'
require 'singleton'

class QuestionDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Question
    attr_accessor :title, :body, :user_id
    def self.all
        data = QuestionDBConnection.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }

    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def create
        raise "#{self} already in database" if @id
        QuestionDBConnection.instance.execute(<<-SQL, @title, @body, @user_id)
            INSERT INTO
                questions (title, body, user_id)
            VALUES
                (?, ?, ?, ?)

        SQL
        @id = QuestionDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QuestionDBConnection.instance.execute(<<-SQL, @title, @body, @user_id, @id)
            UPDATE
                questions
            SET
                @title = ?, @body = ?, @user_id = ?
            WHERE
                @id = ?

        SQL
    end

end