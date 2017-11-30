-- +micrate Up
CREATE TABLE post_comments (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  name VARCHAR,
  body TEXT,
  age INT,
  published BOOL,
  post_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX post_comment_user_id_idx ON post_comments (user_id);
CREATE INDEX post_comment_post_id_idx ON post_comments (post_id);

-- +micrate Down
DROP TABLE IF EXISTS post_comments;
