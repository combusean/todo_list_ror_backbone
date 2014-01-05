class TodoList.Views.Footer extends Backbone.View
  el: '#footer'
  template: JST['tasks/footer']
  initialize: ->
  render: ->
    remaining = @collection.length
    $(@el).html(@template({remaining: remaining}))
    @
