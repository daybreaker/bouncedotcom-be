# README

Rails API with JWT (https://www.sitepoint.com/authenticate-your-rails-api-with-jwt-from-scratch/)

```
Users#create (Returns JWT)
POST /users

{
  "user": {
    "email": "test@example.com",
    "password": "anewpassword",
    "password_confirmation": "anewpassword"
  }
}

Users#login (returns JWT)
POST /users/login

{
  "email": "test@example.com",
  "password": "anewpassword"
}

Users#show (returns user info & all bounces)
GET /users/:id

Bounces#index
GET /bounces

Bounces#Show
GET /bounces/:bounce_id

Bounces#create (Requires JWT)
POST /bounces

Headers:
  Authorization: JWT TOKEN FROM LOGIN
Body:
{
  "user_id": 1,
  "cloudinary_id": "hashtest",
  "title": "TESTING"
}
```
