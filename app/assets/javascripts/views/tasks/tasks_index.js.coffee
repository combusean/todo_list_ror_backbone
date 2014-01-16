class TodoList.Views.TasksIndex extends Backbone.View
  el: '#app'
  template: JST['tasks/index']
  events: 
    'keypress #task-name-input': 'createOnEnter',
    'click #task-submit-button': 'createFromInput'
  initialize: ->
    @collection.bind 'reset', @render, @
    @collection.bind 'add', @addTask, @
  render: ->
    $(@el).html(@template())
    footerView = new TodoList.Views.Footer collection: @collection
    footerView.render()

    @collection.each (task) =>
      view = new TodoList.Views.TasksItem model: task
      @$('#tasks').append(view.render().el)
    
    @
  addTask: (task) ->
    view = new TodoList.Views.TasksItem model: task
    @$('#tasks').append(view.render().el)
    @
  createOnEnter: (event) ->
    return if event.keyCode != 13
    createFromInput
    
  createFromInput: (event) ->
    @collection.create name: @$('#task-name-input').val()
    @$('#task-name-input').val('')
