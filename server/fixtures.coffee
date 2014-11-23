if Meteor.users.find().count() == 0
  userId = Meteor.users.insert
    username: "admin"
  Accounts.setPassword(userId, 'admin')
