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
  position: 'admin',
  email: 'lee@example.com')
topic1 = Topic.create(name: "Computer Science", users: [user1, user2])
topic2 = Topic.create(name: "AI", users: [user1])
question1 = Question.create(body: "How does a beginner start to learn machine learning?",
                            user: user1, 
                            topics: [topic1, topic2])
question2 = Question.create(body: "Can human level AI be reached?", 
                            user: user1, 
                            topics: [topic1, topic2])

answer1= Answer.create(body: "Answer1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse viverra sapien vitae tempus consectetur. Morbi et maximus ipsum. Phasellus commodo viverra quam, rhoncus rutrum nisl congue ut. Praesent cursus euismod tempus. Aenean non orci in lorem sollicitudin laoreet nec sed dui. Donec in arcu nisi. Donec dapibus sem justo, at semper nisi condimentum at.",
                       user: user1, 
                       question: question1)

answer2= Answer.create(body: "Answer2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse viverra sapien vitae tempus consectetur. Morbi et maximus ipsum. Phasellus commodo viverra quam, rhoncus rutrum nisl congue ut. Praesent cursus euismod tempus. Aenean non orci in lorem sollicitudin laoreet nec sed dui. Donec in arcu nisi. Donec dapibus sem justo, at semper nisi condimentum at.",
                       user: user1, 
                       question: question2)

answer3= Answer.create(body: "Answer3 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse viverra sapien vitae tempus consectetur. Morbi et maximus ipsum. Phasellus commodo viverra quam, rhoncus rutrum nisl congue ut. Praesent cursus euismod tempus. Aenean non orci in lorem sollicitudin laoreet nec sed dui. Donec in arcu nisi. Donec dapibus sem justo, at semper nisi condimentum at.",
                       user: user2, 
                       question: question1)

