class Spinning.Views.Form extends Backbone.View

  events:
    'click .m-spinning-form--creation': 'createSpinning'

  initialize: ->
    @spinnings = new Spinning.Collections.Spinnings
    @listView  = new Spinning.Views.List(collection: @spinnings).render()

  createSpinning: (event) ->
    event.preventDefault()
    $.post(@$el.attr('action'), @$el.serialize()).done((data) => @spinnings.reset(data.spinnings));

