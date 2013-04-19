Concern = require 'models/concern'

class New extends Spine.Controller
  className: 'row-fluid concern-new'

  elements:
    'form': 'form'

  events:
    'submit form': 'save'

  constructor: ->
    super
    @html require 'views/concerns/new'

  save: (e) =>
    e.preventDefault()
    concern = (new Concern).fromForm(e.target)
    concern.one 'save', =>
      Concern.trigger "concern:#{concern.state()}", concern.cid
      @form[0].reset()

    concern.save()

module.exports = New
