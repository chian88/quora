1. Create pages
  - index page
  - show question page
  - register page
  - login page
  - profile page 
    - list down all questions by user
    - list down all answers by user
    - list down all interest categories by user.
  - settings
    - change name, email, password
    - change topic of interest
  - when trying to ask question, show a modal 



Models

User
  - user can follow topic that she likes
  - index pages will show only feeds that she follows
  - has a 
    - name - string
    - description - text
    - location - string
    - work - string
    - topic interested - Object Topic (has many)
    - datetime (when the User joined)

Topic
  - a particular topic that a User knows about
  - has many Question (many_to_many relationship)


Notification
  - belongs to the user.
  - will present to the User any new question that is asked related to his topic of interest
  - will present to the User any new answer that she make. 

Question
  - contain a body, text type
  - has a datetime
  - has many Topic (many_to_many relationship)
  - belongs to a User

Answer
  - contain a body, text type
  - has many Vote
  - has a datetime
  - belongs to a user

Vote
  - belongs to a user and a answer
  - has a boolean value, true




Features to implement

login features
- if user already logged in , then redirect to question index page when go to pages#front page
- implement a profile page. which is to edit user info.


- Home tab is where your question are
- Answer tab is where question that you are interested will be , but your question will be ommited
- Notification is a list of message that someone else has answered your question, or you have posted a question, or someone else has posted a question with a topick that u are interested in.


missing features
- search features - 
- notifications
- answer page 
- related question function in show question page.
- all validation features.



- task today
 + implement the voting function +


 + search function (a bit simple). +
 + implement a feature where top voted answers will be at the top. +

 + implement a feature where, the answer will be limited to a few characters +
 

 + implement notifications +
 + implement the answer page +


 + implement a views system for each question. +


+ implement pagination for quora first page

+ validation
+ refactor a lot of code.
  - go by controller one by one

  - then go by model one by one.






















