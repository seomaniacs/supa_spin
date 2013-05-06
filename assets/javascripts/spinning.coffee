#= require_self

#= require_tree ../templates/spinning_app
#= require ./spinning_app/models/spinning
#= require ./spinning_app/collections/spinnings
#= require ./spinning_app/views/form
#= require ./spinning_app/views/list

window.Spinning =
  Models:      {}
  Collections: {}
  Views:       {}

  initialize: ->
    spinning = $('.m-spinning')
    if spinning.length
      new Spinning.Views.Form(el: spinning.find('.m-spinning-form')).render()
