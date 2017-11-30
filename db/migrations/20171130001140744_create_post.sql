-- +micrate Up
CREATE TABLE posts (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  name VARCHAR,
  body TEXT,
  age INT,
  published BOOL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX post_user_id_idx ON posts (user_id);

-- +micrate Down
DROP TABLE IF EXISTS posts;
