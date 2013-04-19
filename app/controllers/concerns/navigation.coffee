Concern = require 'models/concern'

class Navigation extends Spine.Controller
  className: 'row-fluid controller'

  events:
    'click .edit':     'edit'
    'click .complete': 'complete'
    'click .pending':  'pending'
    'click .delete':   'destroy'

  constructor: ->
    super
    @html(require('views/concerns/navigation')(Concern.findCID(@cid)))

  edit: (e) =>
    e.preventDefault()
    @navigate("concerns-#{ @cid }-edit", shim: true)

  destroy: (e) =>
    e.preventDefault()
    Concern.findCID(@cid).destroy()
    Concern.trigger "delete/#{@cid}"

  complete: (e) =>
    e.preventDefault()
    concern = Concern.findCID @cid
    concern.complete = true
    @save(concern)

  pending: (e) =>
    e.preventDefault()
    concern = Concern.findCID @cid
    concern.complete = false
    @save(concern)

  save: (concern) =>
    concern.bind 'save', =>
      Concern.trigger("concern:#{ concern.state() }", concern.cid)

    concern.save()

module.exports = Navigation
