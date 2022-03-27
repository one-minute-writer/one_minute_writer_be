# GraphQL

## Get Users (Query)
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