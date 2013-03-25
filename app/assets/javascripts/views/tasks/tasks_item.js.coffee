class TodoList.Views.TasksItem extends Backbone.View
  template: JST['tasks/item']
  events: 
    'click a.remove-task' : 'removeTask'
  initialize: ->
    @model.bind 'destroy', @remove, @
  render: ->
    $(@el).html(@template(task: @model))
    @
  removeTask: ->
    @model.destroy()
