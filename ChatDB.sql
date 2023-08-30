CREATE DATABASE IF NOT EXISTS chat
DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

use chat;

CREATE TABLE IF NOT EXISTS users(
    user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    login VARCHAR(50) NOT NULL UNIQUE
    );

CREATE TABLE IF NOT EXISTS passwords (
    user_id INTEGER PRIMARY KEY,
    password_hash VARCHAR(32) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
    );

CREATE TABLE IF NOT EXISTS messages (
    message_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    from_id INTEGER NOT NULL,
    to_id INTEGER NOT NULL,
    message TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    FOREIGN KEY (from_id) REFERENCES users(user_id),
    FOREIGN KEY (to_id) REFERENCES users(user_id)
    ) CHARACTER SET utf8;

INSERT INTO users(name, login) VALUES
 ('All', 'All'),
 ('Michail', 'Misha'),
 ('Pavel', 'Pasha'),
 ('Oleg', 'Oleg');
   
-- 2981328698 хэш пароля qwerty 
INSERT INTO passwords(user_id, password_hash) VALUES
    (1, '2981328698'),
    (2, '2981328698'),
    (3, '2981328698'),
    (4, '2981328698');

INSERT INTO messages(from_id, to_id, message) VALUES 
    (2, 1, 'hi all'),
    (3 ,1 ,'Добрый день'),
    (2 ,3 ,'Как дела?'),
    (3 ,2 ,'Хорошо , а у тебя?'),
    (2 ,3 ,'Тоже неплохо'),
    (4 ,1 ,'Привет');messagesmessagesmessages