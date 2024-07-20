-- +goose Up
ALTER TABLE users ADD COLUMN api_key VARCHAR(64) unique not null default(
  encode(sha256(random()::text::bytea),'hex')
);


-- +goose Down
ALTER TABLE USERS DROP COLUMN api_key;
