# GraphQL
## Table of Contents:
* [Users](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#users)
  * [Get Users (Query)](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#get-users-query)
  * [Get User (Query)](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#get-user-query)
  * [Create New User](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#create-new-user)
  * [Update User](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#update-user)
  * [Delete User](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#delete-user)
* [Stories](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#stories)
  * [Get Stories (Query)](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#get-stories-query)
  * [Get Story (Query)](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#get-story-query)
  * [Create Story](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#create-story)
  * [Update Story](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#update-story)
  * [Delete Story](https://github.com/one-minute-writer/one_minute_writer_be/blob/main/GraphqlNotes.md#delete-story)

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
    stories {
      id
      title
      word
    }
  }
}
```
 - Response
 ```
{
  "data": {
    "fetchUser": {
      "id": "1",
      "username": "Solon",
      "email": "rodolfo.schoen@runte.com",
      "stories": [
        {
          "id": "1",
          "title": "Blood's a Rover",
          "word": "aut"
        },...
      ]
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

## Create Story
 - Request
```
mutation {
  createStory(input:
    { userId: 1, title: "Thoughts", bodyText: "hello world", word: "test", image: {author: "william", download_url: "http:test_url.com"}, sound: {title: "denver skyline", src: "http:beautifuldenver.com"}, totalTimeInSeconds: 120 } ) {
  	story {
    	title
    	bodyText
        word
        image
        sound
        totalTimeInSeconds
      createdAt
      updatedAt
    }
  }
}
```
 - Response
 ```
 {
   "data": {
     "createStory": {
       "story": {
         "title": "Thoughts",
         "bodyText": "hello world",
         "word": "test",
         "image": {
           "author": "william",
           "download_url": "http:test_url.com"
         },
         "sound": {
           "title": "denver skyline",
           "src": "http:beautifuldenver.com"
         },
         "totalTimeInSeconds": 120,
         "createdAt": "2022-04-04T17:36:45Z",
         "updatedAt": "2022-04-04T17:36:45Z"
       }
     }
   }
 }
```

## Update Story
 - Request
```
mutation {
  updateStory(input:
    { id: 2, title: "test", bodyText: "new body text", (other attributes etc.) } ) {
  	story {
    	title
    	bodyText
        word
        image
        sound
        totalTimeInSeconds
    }
  }
}
```
 - Response
 ```
{
    "data": {
        "updateStory": {
            "story": {
                "title": "test",
                "bodyText": "new body text",
                "word": "example",
                "image": "example",
                "sound": "example",
                "totalTimeInSeconds": 120
            }
        }
    }
}
```

## Delete Story
 - Request
```
mutation {
  deleteStory(input:
    { id: 14 } ) {
  	story {
    	title
    	bodyText
    }
  }
}

```
 - Response
 ```
{
    "data": {
        "deleteStory": {
            "story": {
                "title": "y",
                "bodyText": "x"
            }
        }
    }
}
```
