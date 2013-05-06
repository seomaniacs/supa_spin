class Spinning.Views.List extends Backbone.View
  el: $('.m-spinning-list')

  initialize: ->
    @collection.bind('reset', @render)

  render: =>
    @$el.empty()
    @collection.each((model) => @$el.append(JST['spinning_app/spinning'](model: model.attributes)))
