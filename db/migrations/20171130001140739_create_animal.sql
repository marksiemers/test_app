-- +micrate Up
CREATE TABLE animals (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  body TEXT,
  published BOOL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS animals;
