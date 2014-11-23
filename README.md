# Meteor URL Shortener

Your own URL shortener based on meteor. Deployed to heroku and ready to use in just a few minutes.

I used my own [boilerplate](http://c.5p.io/meteor-boilerplate) to get started, feel free to check it out and use it for your own apps.

## Basic Usage

Just clone and run `meteor`, the default username and password are both `admin`

This app was built for deployment with [Heroku](http://heroku.com) but should work just fine on any other meteor capable setup.

## Deployment instructions

### Meteor.com
* Clone the project using `git clone git@github.com:shrikantpatnaik/meteor-url-shortener.git`
* Go into the directory you cloned
      * `cd meteor-url-shortener`
* Just deploy!
    * `meteor deploy myapp.meteor.com`

### Heroku

Steps here are borrowed from [here](http://www.growthux.com/ux-html-css-js-growth-hack/installing-meteor-on-heroku)

* Clone the project using `git clone git@github.com:shrikantpatnaik/meteor-url-shortener.git`
* Sign up for a heroku account [here](https://signup.heroku.com) if you don't have one already
* Install the Heroku Toolbelt for your OS [here](https://toolbelt.heroku.com)
* Register at [MongoLab](https://mongolab.com/signup) if you haven't already and create a new free database
* Go into the directory you cloned
      * `cd meteor-url-shortener`
* Login to heroku
      * `heroku login`
* Create a new heroku app with the horse buildpack
      * `heroku create sp-url-short --stack cedar --buildpack https://github.com/AdmitHub/meteor-buildpack-horse`
* Set up the MONGO_URL for the app
      * `heroku config:set MONGO_URL=mongodb://<username>:<password>@ds027308.mongolab.com:27308/<dbname>`
* Setup the ROOT_URL for the app
      * `heroku config:set ROOT_URL=http://<appname>.herokuapp.com` or `heroku config:add ROOT_URL=http://yourdomain.com`
* Push to app to the server
      * `git push heroku master`
* And Voila!! your app is ready at `appname.herokuapp.com`

* I would recommend changing the password as soon you start using it!

### Meteor Up

* This can also be deployed to your own server using [Meteor Up](https://github.com/arunoda/meteor-up), just follow the instructions
in the README and you should be good to go.

## License

Copyright (c) 2014 Shrikant Patnaik Licensed under the MIT license.
