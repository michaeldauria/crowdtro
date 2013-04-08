require('lib/setup')

Spine = require('spine')

ConcernsController = require 'controllers/concerns_controller'
Spinner            = require 'controllers/spinner'

class Crowdtro extends Spine.Stack
  controllers:
    spinner:  Spinner
    concerns: ConcernsController

  routes:
    'spinner':  'spinner'
    'concerns': 'concerns'

  default: 'spinner'

  constructor: ->
    super

    setTimeout =>
      @navigate 'concerns'
    , 2000

module.exports = Crowdtro
