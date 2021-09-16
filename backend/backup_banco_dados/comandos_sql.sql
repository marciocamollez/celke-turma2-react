create database celke character set utf8mb4 collate utf8mb4_unicode_ci;

CREATE TABLE `users` (
     `id` int NOT NULL AUTO_INCREMENT,
      `name` varchar(220) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
      `email` varchar(220) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
      PRIMARY KEY (`id`)    
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT * FROM users;

INSERT INTO users (name, email) VALUES ('Cesar', 'cesar@celke.com.br');

INSERT INTO users (name, email) VALUES ('Cesar2', 'cesar2@celke.com.br');
INSERT INTO users (name, email) VALUES ('Cesar3', 'cesar3@celke.com.br');
INSERT INTO users (name, email) VALUES ('Cesar4', 'cesar4@celke.com.br');
INSERT INTO users (name, email) VALUES ('Cesar5', 'cesar5@celke.com.br');
INSERT INTO users (name, email) VALUES ('Cesar6', 'cesar6@celke.com.br');
INSERT INTO users (name, email) VALUES ('Cesar7', 'cesar7@celke.com.br');

SELECT id, name, email FROM users LIMIT 3;
SELECT id, name, email FROM users LIMIT 2 OFFSET 4;
SELECT id, name, email FROM users WHERE email = 'cesar@celke.com.br' LIMIT 1;
SELECT id, name, email FROM users WHERE email = 'cesar@celke.com.br' AND name = 'Cesar' LIMIT 1;
SELECT id, name, email FROM users WHERE email = 'cesar@celke.com.br' OR name = 'Cesar' LIMIT 1;
SELECT id, name, email FROM users ORDER BY id ASC;
SELECT id, name, email FROM users ORDER BY id DESC;

UPDATE users SET name='Cesar 3a', email='cesar3a@gmail.com.br' WHERE id=3;

DELETE FROM users WHERE id=7;

