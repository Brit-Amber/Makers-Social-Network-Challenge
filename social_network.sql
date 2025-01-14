CREATE TABLE user_accounts(
  id SERIAL PRIMARY KEY,
  email text, 
  username text
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text, 
  views int,
  user_account_id int,
  constraint fk_user_account foreign key(user_account_id)
    references user_accounts(id)
    
);

