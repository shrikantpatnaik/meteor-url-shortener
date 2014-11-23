Template.urlCreate.events
  "submit form": (e) ->
    e.preventDefault()
    url =
      url: $(e.target).find("[name=fullUrl]").val()
    name = $(e.target).find("[name=shortUrl]").val()
    unless name is ""
      url.name = name
    Meteor.call 'urlInsert', url, (error, result) ->
      if error
        return alert(error.reason)
      if result.urlExists
        throwError "This url already exists"
        Router.go 'urlItem',
          _id: result._id
      else if result.nameExists
        throwError "This short url already exists"  if result.nameExists
      else
        Router.go 'urlList'


Template.urlCreate.created = ->
  Session.set "urlCreateErrors", {}
  return

Template.urlCreate.helpers
  errorMessage: (field) ->
    Session.get("urlCreateErrors")[field]

  errorClass: (field) ->
    (if !!Session.get("urlCreateErrors")[field] then "has-error" else "")

  hostname:
    window.location.origin
