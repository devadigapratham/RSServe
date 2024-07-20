# RSS Feed Aggregator and Scraper 

## Description

The RSS Feed Aggregator and Scraper is a blog aggregator service built in Go. This project showcases the construction of a RESTful API using Go, integrated with production-ready database tools such as PostgreSQL, SQLc, Goose, and pgAdmin. Unlike standard CRUD applications, this service features a long-running service worker that fetches data from remote locations over the internet, making it a robust solution for aggregating and scraping blog content.

## Features

- Sleek RESTful API built with the magic of Go.
- Swift routing with chi router 🚦.
- Rock-solid database management using PostgreSQL.
- Smooth database migrations with the help of Goose 🦢.
- SQL wizardry courtesy of SQLc.
- Keep tabs on your database kingdom with pgAdmin 🏰.
- A diligent service worker that fetches data without breaking a sweat.

## Technologies Used

- Go
- Chi router
- SQLc
- Goose
- pgAdmin
- PostgreSQL

## Installation and Setup

Follow these steps to get your aggregator up and running:

1. **Clone the project**

```
git clone <repository-url>
```

2.  **Run database migrations**

```
cd sql/schema
goose postgres 'postgres://postgres:root@localhost:5432/rssagg' up
```

make sure you have PostgresQL database installed, I recommend creating a new database named "rssagg" using pgadmin

3. **Run the application**

```
go build && ./go-RssAggregator.exe
```

## 📚 API Documentation

Our service contains a set of API calls. You can use the Thunder Client to try them out:

1. ### Health Check

- **Endpoint**: POST http://localhost:8080/v1/healthz
- **Description**: Checks the health of the API service.
- **Headers**: None
- **Body**: None

2. ### Simulate Error

- **Endpoint**: GET http://localhost:8080/v1/error
- **Description**: Simulates an error response for testing purposes.
- **Headers**: None
- **Body**: None

3. ### Create User

- **Endpoint**: POST http://localhost:8080/v1/user
- **Description**: Creates a new user.
- **Headers**: None
- **Body**:

```
{
  "name": "User Name"
}
```

4. ### Get User

- **Endpoint**: GET http://localhost:8080/v1/user
- **Description**: Retrieves user information. API_KEY can be retrieved from database
- **Headers**:
  - Authorization: ApiKey YOUR_API_KEY
- **Body**: None

5. ### Create Feed

- **Endpoint**: POST http://localhost:8080/v1/feed
- **Description**: Creates a new feed entry.
- **Headers**:
  - Authorization: ApiKey YOUR_API_KEY
- **Body**:

```
{
  "name": "Lanes Blog",
  "url": "https://www.wagslane.dev/index.xml"
}
```

6. ### Create Feed

- **Endpoint**: GET http://localhost:8080/v1/feeds
- **Description**: Retrieves a list of all feeds.
- **Headers**: None
- **Body**: None

7. ### Create Feed Follow

- **Endpoint**: POST http://localhost:8080/v1/feed_follows
- **Description**: Creates a follow relationship to a feed.
- **Headers**:
  - Authorization: ApiKey YOUR_API_KEY
- **Body**:

```
{
   "feed_id": "529c8b81-3259-4699-994e-112fbbe93600"
}
```

8. ### Get Feed Follows

- **Endpoint**: GET http://localhost:8080/v1/feed_follows
- **Description**: Retrieves a list of feeds the user follows.
- **Headers**:
  - Authorization: ApiKey YOUR_API_KEY
- **Body**: None

9. ### Delete Feed Follows

- **Endpoint**: DELETE http://localhost:8080/v1/feed_follows/{feed_id}
- **Description**: Deletes a follow relationship to a feed.
- **Headers**:
  - Authorization: ApiKey YOUR_API_KEY
- **Body**: None

10. ### Get User Posts

- **Endpoint**: GET http://localhost:8080/v1/posts
- **Description**: Retrieves posts for a user.
- **Headers**:
  - Authorization: ApiKey YOUR_API_KEY
- **Body**: none

### Authentication

For endpoints requiring authentication, include an Authorization header with your API key:

```
Authorization: ApiKey YOUR_API_KEY
```

Your API key can be obtained from a user in the database.
