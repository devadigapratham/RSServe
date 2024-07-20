-- name: CreateFeed :one
INSERT INTO feeds (id, created_at, updated_at, name, url, user_id)
VALUES ($1,$2,$3,$4,$5,$6)
RETURNING *;


-- name: GetFeeds :many
SELECT * from feeds;

-- name: GetNextFeedsToFetch :many
SELECT * from feeds
ORDER BY last_fetched_at ASC NULLS FIRST
LIMIT $1;

-- name: MarkFeedAsFetched :one
UPDATE feeds
SET last_fetched_at = now(),
updated_at = now()
WHERE id = $1
RETURNING *;
