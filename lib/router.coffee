Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'
  waitOn: ->
    [
      Meteor.subscribe 'urls'
      Meteor.subscribe 'currentUser'
    ]

Router.route "/",
  name: "urlCreate"

Router.route "/admin/list",
  name: "urlList"

Router.route "/admin/:_id",
  name: "urlItem"
  data: ->
    Urls.findOne @params._id

Router.route "/api/add",
  name:"apiAdd"
  action: ->
    url = {}
    url.url = @params.query.url
    url.name = @params.name if @params.query.name
    @router = Router
    Meteor.call 'urlInsert', url, (error, result) =>
      @redirect 'urlList'

Router.route "/:name",
  where: 'server'
  name: 'goTo'
  action: ->
    url = Urls.findOne({name: @params.name})
    if url
      Urls.update
        _id: url._id
      ,
        $set:
          clicks: url.clicks + 1
      @response.writeHead 301,
        'Location' : url.url
    else
      @response.writeHead 404,
        "Content-Type": "text/html"
      @response.write "URL Not found"
    @response.end()

requireLogin = ->
  unless Meteor.user()
    if Meteor.loggingIn()
      @render @loadingTemplate
    else
      @render "accessDenied"
  else
    @next()
  return

Router.onBeforeAction requireLogin,
  except: ['goTo']
