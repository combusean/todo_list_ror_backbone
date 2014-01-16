describe 'TodoListTasksIndexView', ->
  
  beforeEach ->
    @model = new Backbone.Model {id: 1, name: 'Task 1', completed: 0 }
    @view = new Backbone.TodoList.Views.TasksIndex
  
  describe '#', ->
    it 'should display the app div', ->
      @view.render
      expect($('#app')).toExist
       
  
