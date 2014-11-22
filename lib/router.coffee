Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

Router.route "/",
  name: "page1"

Router.route "/page2",
  name: "page2"
