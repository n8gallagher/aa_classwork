require 'sqlite3'
require 'singleton'
require_relative 'questions'

class User

    def self.all
        data = QuestionDBConnection.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def create
        raise "#{self} already in database" if @id
        QuestionDBConnection.instance.execute(<<-SQL, @fname, @lname)
            INSERT INTO
                users (fname, lname)
            VALUES
                (?, ?)

        SQL
        @id = QuestionDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QuestionDBConnection.instance.execute(<<-SQL, @fname, @lname, @id)
            UPDATE
                users
            SET
                @fname = ?, @lname = ?
            WHERE
                @id = ?
        SQL

    end

end