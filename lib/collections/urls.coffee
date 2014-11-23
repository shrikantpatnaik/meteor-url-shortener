@Urls = new Mongo.Collection 'urls'

@Urls.allow
  update: ->
    true

Meteor.methods
  urlInsert: (urlAttributes) =>
    check urlAttributes.url, String
    check urlAttributes.name, String if urlAttributes.name

    errors = validateUrl(urlAttributes)
    throw new Meteor.Error("invalid-pos2t", "You must set a URL")  if errors.url
    sameUrl = @Urls.findOne(url: urlAttributes.url)
    if sameUrl
      return {
      urlExists: true
      _id: sameUrl._id
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

