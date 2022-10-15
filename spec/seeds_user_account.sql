-- TRUNCATE TABLE posts RESTART IDENTITY;
-- INSERT INTO posts (title, content, views, user_account_id) VALUES ('yes', 'no', 100, 1);

TRUNCATE TABLE user_accounts RESTART IDENTITY CASCADE; -- replace with your own table name.
INSERT INTO user_accounts (email, username) VALUES ('makers@hotmail.com', 'makers1');
