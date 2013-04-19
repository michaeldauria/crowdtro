Concern    = require 'models/concern'
Navigation = require 'controllers/concerns/navigation'
Stack      = require 'controllers/concerns/stack'

class Item extends Spine.Controller
  className: 'row-fluid controller concern-item'

  constructor: ->
    super
    @append new Stack(cid: @cid)
    @append new Navigation(cid: @cid)

    Concern.bind "delete/#{@cid}", @release

    concern = Concern.findCID @cid
    @setId concern.id

    @el.attr('cid', "concern-#{ @cid }")

    unless concern.isPersisted()
      Concern.bind 'ajaxSuccess', =>
        concern = Concern.findCID @cid
        @setId(concern.id)
        Concern.unbind 'ajaxSuccess' if concern.isPersisted()

  setId: (id) => @el.attr('id', "concern-#{ id }")

module.exports = Item
