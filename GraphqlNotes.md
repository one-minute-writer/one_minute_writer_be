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
  addUser(input: { params: { username: "Clifford", email: "cliff@bigred.com" } }) {
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
    "addUser": {
      "user": {
        "username": "Clifford",
        "email": "cliff@bigred.com"
      }
    }
  }
}
```

## Edit User
 - Request
```
mutation {
  editUser(input: { params: { username: "Bob Ward", email: "bob@athens.com" }}) {
    user {
      id
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
    "editUser": {
      "user": {
        "id": "7",
        "username": "Bob Ward",
        "email": "bob@athens.com"
      }
    }
  }
}
```