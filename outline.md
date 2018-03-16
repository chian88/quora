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