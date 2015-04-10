# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
dwyane = User.create(username: "IamDwyane", email: "myemail@gmail.com", password: "1234", location: "Georgia", first_name: "Dwyane", last_name: "Dwyane", avatar: "http://upload.wikimedia.org/wikipedia/commons/e/e2/Intercontinental_Champion_THE_ROCK.jpg" )

chad = User.create(username: "IamChad", email: "chadmail@chad.com", password: "1234", location: "Mississippi", first_name: "Chad", last_name: "Dwyane", avatar: "http://i.imgur.com/VlflUyi.jpg")

murphy = User.create(username: "IamMurphy", email: "murphy@murphy.com", password: "1234", location: "Louisiana", first_name: "Murphy", last_name: "Dwyane", avatar: "https://itsrockingwrestling.files.wordpress.com/2011/05/the-rock1.jpg")

question1 = dwyane.questions.create(title: "What is Dwyane?", body: "Dwyane is the Rock. And Dwyane says what Dwyane wants?")

chads_answer = chad.answers.create(question_id: question1.id, content: "Nobody is saying that Dwyane can't do what he wants.", best: true)

murphy_answer = murphy.answers.create(question_id: question1.id, content: "MY NAME IS MURPHY!", best: false)


chad_comment = murphy_answer.comments.create(content: "murphy, that is the worst answer you could have possible given.", user_id: chad.id)




