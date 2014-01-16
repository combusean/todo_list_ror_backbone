require 'spec_helper'

describe TasksController do 
  before :all do
    @task1 = FactoryGirl.create(:task, :name => 'Task 1', :completed => 0) 
    @task2 = FactoryGirl.create(:task, :name => 'Task 2', :completed => 0) 
  end

  after :all do
    Task.destroy_all
  end

  context '#index' do
    it 'lists all tasks' do
      get 'index', :format => 'json'
      body = JSON.parse(response.body)
      body.size.should == 2
      body.first['name'].should == 'Task 1'
    end
  end

  context '#show' do
    it 'can show a task by ID' do
      get 'show', :format => 'json', :id => 1
      JSON.parse(response.body)['name'].should == 'Task 1'
    end
  end

  context '#new' do
    it 'gets a null task' do
      get 'new', :format => 'json'
      response.body.should == load_fixture('new_task.json').strip
    end
  end

  context '#create' do
    it 'can create a new task' do
      fixture = JSON.parse(load_fixture('create_task.json'))
      post 'create', :format => 'json', :body => load_fixture('create_task.json')

      response.location.should == 'http://test.host/tasks/3'
      JSON.parse(response.body)['name'].should == fixture['name']
      Task.all.count.should == 3
    end
  end

  context '#update' do
    it 'can update an existing task' do
      put 'update', :format => 'json', :id => @task1, :completed => 1
      response.status.should == 204
      @task1.reload
      @task1.completed.should == 1
    end
  end
  
  context '#delete' do
    it 'can delete a record by id' do
      delete 'destroy', :format => 'json', :id => @task2
      response.status.should == 204
      Task.all.count.should == 1 
    end
  end

end
