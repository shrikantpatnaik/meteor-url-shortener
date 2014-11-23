Meteor.publish 'urls', ->
  Urls.find {},
    sort:
      created: -1

Meteor.publish "currentUser", ->
  Meteor.users.find @userId
