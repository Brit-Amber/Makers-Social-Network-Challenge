TRUNCATE TABLE posts RESTART IDENTITY;
INSERT INTO posts (title, content, views, user_account_id) VALUES ('yes', 'no', 100, 1);