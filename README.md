# 404 Test Task 

[task link](https://docs.google.com/document/d/1bM0r2Da5KIrb0rHUIuZiIK6IQmMhmL_AJabcoCTbzx4/edit?usp=sharing)

- clone project
- run `mv database.yml.example database.yml`
- set up `database.yml` 
- run `rake db:create`
- run `rake db:migrate`
- run `rake db:seed`
- run `rails s`
- run in another terminal window `sidekiq`

### User authentication:

 - Request: 
 ```bash
curl -H "Content-Type: application/json" \
      -d '{"email":"user@example.com","password":"password"}' \
      -X POST http://localhost:3000/authenticate
```

- Success response:
```json
{
  "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1Mzk2NDU1NTV9._JJJ0ZQyZFQacG3pB1EVGHGBq9kZ5lMio2sqV8_has0",
}
```

- Fail response:
```json
{
  "error": "Not Authorized",
}
```

### Send message:

 - Request (use token from authentication request): 
 ```bash
curl -H "Content-Type: application/json" \
      -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1Mzk2NDMxNDZ9.huB6roOv-QIn_YVcvjVGfdhJaWhYjGL0NEKrb0SItRs"  \
      -d '{"body":"privet","to":{"Homer Simpson":"telegram"},"start":"2018-10-14 22:45:00"}' \
      -X POST http://localhost:3000/send_message
```

- If successful, returns:
```json
{
  "status": "Message successfully sent."
}
```

- If failed, returns errors:
```json
{
  "errors": "No recipient was received",
}
```

> if parameter `start` has been transmitted, the message will be sent in accordance with the parameter. You can see scheduled messages at http://localhost:3000/sidekiq

Sidekiq был выбран мной потому что с ним уже приходилось сталкиваться, он популярен среди адаптеров и бенчмарки говорят о хорошей производительности по сравнению с Resque и DelayedJob