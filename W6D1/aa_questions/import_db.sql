PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,

)

CREATE TABLE  questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
)

CREATE TABLE  question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY question_id REFERENCES questions(id),
    FOREIGN KEY user_id REFERENCES users(id)

)

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    subject_question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,

    FOREIGN KEY user_id REFERENCES users(id),
    FOREIGN KEY subject_question_id REFERENCES questions(id),
    FOREIGN KEY parent_reply_id REFERENCES replies(id)
)

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY user_id REFERENCES users(id),
    FOREIGN KEY question_id REFERENCES questions(id)
)

INSERT INTO
    users (fname, lname)
VALUES
    ('Nate', 'Gallagher')
    ('Harry', 'Potter')
    ('John', 'Doe')

INSERT INTO
    questions (title, body, user_id)
VALUES
    ('Help', 'what is a computer?', 2)
    ('anon', 'seed question', 3)
    ('rails', 'Is this rails?', 1)

INSERT INTO
    replies (body, user_id, subject_question_id, parent_reply_id)
VALUES
    ('No, this is not rails, there is no magic', 2, 3)
    ('Wrong, there is magic', 3, 3, 1)
    ('What is seed?', 1, 2)
    ('A computer is not a bot', 3, 1)

