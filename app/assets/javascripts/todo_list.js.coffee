window.TodoList =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new TodoList.Routers.Tasks
    Backbone.history.start()

$(document).ready ->
  TodoList.init()
