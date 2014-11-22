# counter starts at 0
Session.setDefault "page1Counter", 0
Template.page1.helpers counter: ->
  Session.get "page1Counter"

Template.page1.events "click button": ->
  # increment the counter when button is clicked
  Session.set "page1Counter", Session.get("page1Counter") + 1
  return
