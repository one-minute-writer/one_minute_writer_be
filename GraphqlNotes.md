# GraphQL
## Table of Contents:
* [Users](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#users)
  * [Get Users (Query)](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#get-users-query)
  * [Get User (Query)](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#get-user-query)
  * [Create New User](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#create-new-user)
  * [Update User](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#update-user)
  * [Delete User](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#delete-user)
* [Stories](https://github.com/one-minute-writer/one_minute_writer_be/blob/graphql/GraphqlNotes.md#Stories)
  * [Get Stories (Query)](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#get-stories-query)
  * [Get Story (Query)](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#get-story-query)

## Users
### Get Users (Query)
 - Request
```
query {
  fetchUsers {
    id
    username
    email
  }
}
```
 - Response
 ```
 {
  "data": {
    "fetchUsers": [
      {
        "id": "7",
        "username": "Bob Ward",
        "email": "bob@athens.com"
      },
      {
        "id": "6",
        "username": "Johnathan",
        "email": "j@gmail.com"
      }, ...
    ]
  }
}
```
## Get User (Query)
 - Request
```
query {
  fetchUser(id: 1) {
    id
    username
    email
  }
}
```
 - Response
 ```
{
  "data": {
    "fetchUser": {
      "id": "1",
      "username": "Archimedes",
      "email": "jack@leannon-boyer.info"
    }
  }
}
```

## Create New User
 - Request
```
mutation {
  createUser(input: 
    { username: "Lassie", email: "sillyboy@inwell.com" } ) {
  	user {
    	username
    	email
    }
  }
}
```
 - Response
```
{
  "data": {
    "createUser": {
      "user": {
        "username": "Lassie",
        "email": "sillyboy@inwell.com"
      }
    }
  }
}
```

## Update User
 - Request
```
mutation {
  updateUser(
    input: {
      id: "1",
      username: "Bob Lee Swagger",
      email: "blees@gmail.com"
    }
  ) { 
      user {
        username
        id
        email
      }
    }
}
```
 - Response
 ```
{
  "data": {
    "updateUser": {
      "user": {
        "username": "Bob Lee Swagger",
        "id": "1",
        "email": "blees@gmail.com"
      }
    }
  }
}
```

## Delete User
 - Request
```
mutation {
        deleteUser(
          input: {
            id: "3",
          }
        ) { user {
            username
          }
        }
      }
        

```
 - Response
 ```
{
  "data": {
    "deleteUser": {
      "user": {
        "username": "Galen"
      }
    }
  }
}
```

## Stories

### Get Stories (Query)
 - Request
```
query {
  fetchStories {
    id
    title
    word
  }
}
```
 - Response
 ```
 {
  "data": {
    "fetchStories": [
      {
        "id": "10",
        "title": "expedita",
        "word": "saepe"
      },
      {
        "id": "9",
        "title": "earum",
        "word": "qui"
      }, ...
    ]
  }
}
```

## Get Story (Query)
 - Request
```
query {
  fetchStory(id: 1) {
    id
    title
  }
}
```
 - Response
 ```
{
  "data": {
    "fetchStory": {
      "id": "1",
      "title": "dolor"
    }
  }
}
```
