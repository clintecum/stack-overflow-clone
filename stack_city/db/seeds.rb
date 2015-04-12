
dwyane = User.new
dwyane.username = "IamDwyane" 
dwyane.email = "myemail@gmail.com"
dwyane.encrypted_password = '#$taawktljasktlw4aaglj'
dwyane.save!

chad = User.new
chad.username = "IamChad"
chad.email = "chadmail@chad.com"
chad.encrypted_password = '#$taawktljasktlw4aaglj'
chad.save!

murphy = User.new(username: "IamMurphy", location: "Louisiana", first_name: "Murphy", last_name: "Dwyane", avatar: "https://itsrockingwrestling.files.wordpress.com/2011/05/the-rock1.jpg")
murphy.email =  "murphy@murphy.com"
murphy.encrypted_password = '#$taawktljasktlw4aaglj'
murphy.save!

question1 = dwyane.questions.create(title: "What is Dwyane?", body: "Dwyane is the Rock. And Dwyane says what Dwyane wants?")

chads_answer = chad.answers.create(question_id: question1.id, content: "Nobody is saying that Dwyane can't do what he wants.", best: true)

murphy_answer = murphy.answers.create(question_id: question1.id, content: "MY NAME IS MURPHY!", best: false)


chad_comment = murphy_answer.comments.create(content: "murphy, that is the worst answer you could have possible given.", user_id: chad.id)




