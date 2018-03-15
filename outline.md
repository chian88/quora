1. Create pages
  - index page
  - show question page
  - register page
  - login page
  - profile page
  - when trying to ask question, show a modal 


User Model
  - user can follow topic that she likes
  - index pages will show only feeds that she likes


Notification Model
  - belongs to the user.
  - will present to the User any new question that is asked related to his topic of interest
  - will present to the User any new answer that she make. 

Question Model
  - contain a body, text type
  - belongs to a user

Answer Model
  - contain a body, text type
  - belongs to a user

Vote
  - belongs to a user and a answer
  - has a count , integer type.