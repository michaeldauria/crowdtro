mongoose = require('mongoose')
env      = process.env.NODE_ENV or 'development'

switch(env)
  when 'development'
    mongo_uri = 'mongodb://localhost/crowdtro_development'
  when 'test'
    mongo_uri = 'mongodb://localhost/crowdtro_test'
  when 'production'
    mongo_uri = process.env.MONGOLAB_URI

mongoose.connect mongo_uri

module.exports = mongoose