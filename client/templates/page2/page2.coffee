# counter starts at 0
Session.setDefault "page2Counter", 0
Template.page2.helpers counter: ->
  Session.get "page2Counter"

Template.page2.events "click button": ->
  # increment the counter when button is clicked
  Session.set "page2Counter", Session.get("page2Counter") + 1
  return
