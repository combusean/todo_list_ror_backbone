class TodoList.Views.TasksItem extends Backbone.View
  template: JST['tasks/item']
  events: 
    'click a.task-remove-delete' : 'removeTask',
    'click input.task-completed-check' : 'toggleCompletedTask'
  initialize: ->
    @model.bind 'destroy', @remove, @
  render: ->
    $(@el).html(@template(task: @model))
    @
  removeTask: ->
    @model.destroy()
  toggleCompletedTask: (event) ->
    console.log @model.get("completed")
    if (@model.get("completed") == 1 || @model.get("completed") == true)
      newStatus = 0
    else
      newStatus = 1
    
    console.log newStatus
    @model.save(completed: newStatus)
    console.log @model.get("completed")
