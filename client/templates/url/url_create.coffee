Template.urlCreate.events
  "submit form": (e) ->
    url =
      url: $(e.target).find("[name=fullUrl]").val()
    name = $(e.target).find("[name=shortUrl]").val()
    unless name is ""
      url.name = name
    Meteor.call 'urlInsert', url, (error, result) ->
      if error
        console.log('error')
        return alert(error.reason)
      else
        Router.go 'postPage'

Template.urlCreate.created = ->
  Session.set "urlCreateErrors", {}
  return

Template.urlCreate.helpers
  errorMessage: (field) ->
    Session.get("urlCreateErrors")[field]

  errorClass: (field) ->
    (if !!Session.get("urlCreateErrors")[field] then "has-error" else "")
