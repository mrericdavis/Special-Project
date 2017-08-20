User.create(name:"Peter Jang", email:"peter@email.com", password: "password", bio: "my name is Peter", avatar: "http://www.blogcdn.com/www.bvonmoney.com/media/2009/06/jason_robertson.jpg")
User.create(name:"Eric Davis", email:"eric@email.com", password: "password", bio: "my name is Eric", avatar: "https://s-media-cache-ak0.pinimg.com/originals/1c/a9/a2/1ca9a250a33cd604d4e67630f9a59f6e.jpg")
User.create(name:"Theo Wallas", email:"theo@email.com", password: "password", bio: "my name is Theo", avatar: "https://s-media-cache-ak0.pinimg.com/736x/e6/81/11/e68111de892892fc25b3e72c1ee6a4f6--handsome-black-men-black-man.jpg")
User.create(name:"Denzel Washington", email:"denzel@email.com", password: "password", bio: "my name is Denzel", avatar: "http://media.npr.org/assets/img/2016/03/03/erik-hines-headshot-web_custom-ed902aae5a95e0def8bc41f4a0dad92b2a7fc1ec-s300-c85.jpg")
User.create(name:"Will Smith", email:"will@email.com", password: "password", bio: "my name is Will", avatar: "http://s575.photobucket.com/user/americanparlor/media/43f4e901-001f0-00ee4-400cb8e1.jpg.html")


Image.create(title: "New Pic", url:"http://www.wesspur.com/images/stephan/tree-care.jpg", description:"This is a tree", longitude: "41.8781° N", latitude:"83.6298° W", address:"2637 S Ada", user_id:1)

Image.create(title: "New Pic", url:"http://cdn.homedsgn.com/wp-content/uploads/2013/02/a-house-19-800x548.jpg", description:"This is a house", longitude: "26.8781° N", latitude:"09.6298° W", address:"2637 S Halsted", user_id:3)

Image.create(title: "New Pic", url:"http://www.topgear.com/india/images/stories/car-image-gallery/560x315/2014Jan112141020.jpg", description:"This is a car", longitude: "11.8781° N", latitude:"45.6298° W", address:"2637 S may", user_id:2)

Image.create(title: "New Pic", url:"https://static.pexels.com/photos/59523/pexels-photo-59523.jpeg", description:"This is a pet", longitude: "87.8781° N", latitude:"13.6298° W", address:"2637 S Ashland", user_id:4)

Image.create(title: "New Pic", url:"http://www.gowfb.ca/images/zurich-platform-bed.jpg", description:"This is a bed", longitude: "90.8781° N", latitude:"20.6298° W", address:"2637 S Damen", user_id:2)

Message.create(user_id: 1 , receiver_id: 2, description: "Im a user")
Message.create(user_id: 2 , receiver_id: 3, description: "Im a receiver")
Message.create(user_id: 3 , receiver_id: 4, description: "Im a user and receiver")
Message.create(user_id: 4 , receiver_id: 5, description: "Im a confused")
Message.create(user_id: 5 , receiver_id: 1, description: "No I dont")
Message.create(user_id: 1 , receiver_id: 2, description: "What you think")
Message.create(user_id: 2 , receiver_id: 3, description: "This is it")
Message.create(user_id: 5 , receiver_id: 1, description: "I dont know")

Relationship.create(follower_id: 1, followed_id: 2)
Relationship.create(follower_id: 2, followed_id: 3)
Relationship.create(follower_id: 3, followed_id: 4)
Relationship.create(follower_id: 4, followed_id: 5)
Relationship.create(follower_id: 5, followed_id: 1)
Relationship.create(follower_id: 5, followed_id: 3)
Relationship.create(follower_id: 1, followed_id: 3)
Relationship.create(follower_id: 1, followed_id: 2)
Relationship.create(follower_id: 4, followed_id: 1)
Relationship.create(follower_id: 3, followed_id: 1)

ScoreCard.create(image_id: 1, user_id: 1, value: 1)
ScoreCard.create(image_id: 2, user_id: 3, value: 1)
ScoreCard.create(image_id: 3, user_id: 2, value: -1)
ScoreCard.create(image_id: 4, user_id: 1, value: 0)
ScoreCard.create(image_id: 3, user_id: 4, value: 1)
ScoreCard.create(image_id: 2, user_id: 5, value: 0)
ScoreCard.create(image_id: 1, user_id: 1, value: 1)
ScoreCard.create(image_id: 4, user_id: 1, value: 1)
ScoreCard.create(image_id: 2, user_id: 2, value: 0)
ScoreCard.create(image_id: 3, user_id: 3, value: -1)
ScoreCard.create(image_id: 1, user_id: 1, value: 1)
ScoreCard.create(image_id: 5, user_id: 2, value: -1)