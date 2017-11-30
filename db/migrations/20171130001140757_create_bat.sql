-- +micrate Up
CREATE TABLE bats (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  name VARCHAR,
  body TEXT,
  age INT,
  published BOOL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX bat_user_id_idx ON bats (user_id);

-- +micrate Down
DROP TABLE IF EXISTS bats;
