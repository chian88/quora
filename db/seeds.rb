# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




user1 = User.create(
  name: "David Stiennon", 
  description: "I am just a regular person", 
  location: "California", 
  work: "Software Consultant", 
  password: '123', 
  email: 'david@example.com')
user2 = User.create(
  name: "Chian Yee", 
  description: "I am just a regular person", 
  location: "Kuala Lumpur, Malaysia", 
  work: "Financial Accountant", 
  password: '123', 
  email: 'lee@example.com')
topic1 = Topic.create(name: "Computer Science", users: [user1, user2])
topic2 = Topic.create(name: "AI", users: [user1])
question1 = Question.create(body: "How does a beginner start to learn machine learning?",
                            user: user1, 
                            topics: [topic1, topic2])
question2 = Question.create(body: "Can human level AI be reached?", 
                            user: user1, 
                            topics: [topic1, topic2])

answer1= Answer.create(body: "Answer1 Ah yes, this is so actual. People are getting more and more advanced in their skillset, solving complicated problems and growing professionally but the learning material is just not there yet. Honestly, I don't think this problem will ever be completely solved, because the amounts of different tech stacks and their combinations is unthinkable. It would take ages and ages to record or write down so many tutorials or books for every single problem one might face. As always,The two best techniques to learn advanced things in the programming field and get better stay the same: Read a lot of code Write a lot of code",
                       user: user1, 
                       question: question1)

answer2= Answer.create(body: "Answer2 Ah yes, this is so actual. People are getting more and more advanced in their skillset, solving complicated problems and growing professionally but the learning material is just not there yet. Honestly, I don't think this problem will ever be completely solved, because the amounts of different tech stacks and their combinations is unthinkable. It would take ages and ages to record or write down so many tutorials or books for every single problem one might face. As always,The two best techniques to learn advanced things in the programming field and get better stay the same: \nRead a lot of code \nWrite a lot of code",
                       user: user1, 
                       question: question2)

answer3= Answer.create(body: "Answer3 Ah yes, this is so actual. People are getting more and more advanced in their skillset, solving complicated problems and growing professionally but the learning material is just not there yet. Honestly, I don't think this problem will ever be completely solved, because the amounts of different tech stacks and their combinations is unthinkable. It would take ages and ages to record or write down so many tutorials or books for every single problem one might face. As always,The two best techniques to learn advanced things in the programming field and get better stay the same: \nRead a lot of code \nWrite a lot of code",
                       user: user2, 
                       question: question1)