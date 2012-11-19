## Testing for api to ios application

### get a token
curl -H "Content-type: application/json" -X POST -d '{"user" : {"email" : "", "password" : ""}}' http://<host>/

### user the token
curl -H "Content-type: application/json" -H 'Authorization: Token token=""' http://<host>/

---

