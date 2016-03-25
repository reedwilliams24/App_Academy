-- Users
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

-- Questions
DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

-- Users <--> Questions Join Table
DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- Replies
DROP TABLE IF EXISTS replies;
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

-- Question Likes
DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


-- Seed Data

-- Users
INSERT INTO
  users (fname, lname)
VALUES
  ('Reed', 'Williams'),
  ('Joe', 'Schmoe'),
  ('Tommy', 'Tables');

-- Questions
INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Algorithm Efficiency', 'How do I make this algorithm more efficient?', (SELECT id FROM users WHERE fname = 'Reed' AND lname = 'Williams')),
  ('Ruby Question', 'What does puts do?', (SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Schmoe'));

-- Users <--> Questions Join Table
INSERT INTO
  question_follows (user_id, question_id)
VALUES
  --((SELECT id FROM users WHERE fname = 'Reed' AND lname = 'Williams'), (SELECT id FROM questions WHERE author_id = )),
  (1, 1),
  (2, 2);

-- Replies
INSERT INTO
  replies (question_id, parent_reply_id, author_id, body)
VALUES
  (1, null, 1, 'Do some stuff');

-- Question Likes
INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1, 2);
























  -- end
