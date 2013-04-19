Concern = require 'models/concern'

class Edit extends Spine.Controller
  className: 'row-fluid controller edit-concern'

  events:
    'submit form': 'save'

  constructor: ->
    super
    @active -> @html require('views/concerns/edit')(Concern.findCID @stack.cid)

  save: (e) =>
    e.preventDefault()

    concern = Concern.findCID @stack.cid
    concern.one 'save', =>
      @navigate("concerns-#{ @stack.cid }-show", { shim: true })

    concern.fromForm(e.target).save()

module.exports = Edit
