@Urls = new Mongo.Collection 'urls'

@Urls.allow
  update: ->
    true
  remove: ->
    Meteor.user()

Meteor.methods
  urlInsert: (urlAttributes) =>
    check urlAttributes.url, String
    check urlAttributes.name, String if urlAttributes.name


    errors = validateUrl(urlAttributes)
    urlAttributes.name = urlAttributes.name || ""
    throw new Meteor.Error("invalid-url", "You must set a URL")  if errors.url
    exists = _.first @Urls.find(
      $or : [
        {
          url: urlAttributes.url
        },{
          name: urlAttributes.name
        }
      ]).fetch()
    if exists
      return {
      urlExists: true if exists.url is urlAttributes.url
      nameExists: true if exists.name is urlAttributes.name
      _id: exists._id
      }
    url = _.extend urlAttributes,
      created: new Date()
      clicks: 0

    urlId = @Urls.insert(url)

    unless url.name
      @Urls.update
        _id: urlId
      ,
      $set:
        name: urlId

    {
      _id: urlId
    }

@validateUrl = (url) ->
  errors = {}
  errors.url = "Please fill a url" unless url.url
  errors

