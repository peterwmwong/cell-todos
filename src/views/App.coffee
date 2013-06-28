define (require)->

  x_class = require 'cell/exts/x_class'
  events = require 'cell/dom/events'
  
  Todos = require 'models/Todos'
  Todo = require 'views/Todo'

  App = require('cell/defineView!')

    beforeRender: ->
      @todos = Todos.query()
      @todos.on "all", (type)->
        console.log type
      events.on window, 'hashchange', @onHashChange, @
      @onHashChange()
      return

    renderEl: -> document.body
    render: (_)-> [
      _ 'section#todoapp',
        _ 'header#header',
          _ 'h1',
            'todos'

          _ 'input#new-todo',
            placeholder: 'What needs to be done?'
            type: 'text'
            onkeypress: (e)->
              if e.keyCode is 13
                newTodo = Todos.create text: e.target.value, done: false
                newTodo.$save undefined, => @todos.requery()
                e.target.value = ''
              return

        _ 'section#main',
          _ 'ul#todo-list',
            _.map (->@todos.filterBy done: @get 'filter'), (todo)->
              _ Todo, model: todo

        _ 'footer#footer',
          _ 'span#todo-count',
            -> "#{@incompleteCount()} item#{if @incompleteCount() > 1 then 's' else ''} left"

          _ 'ul#filters',
            _ 'li',
              _ 'a', (x_class selected:-> null  is @get 'filter'), href: '#',
                'All'

              _ 'a', (x_class selected:-> false is @get 'filter'), href: '#/active',
                'Active'

              _ 'a', (x_class selected:-> true  is @get 'filter'), href: '#/completed',
                'Completed'

          ->if @completedCount()
            _ 'button#clear-completed', onclick:@clearCompleted,
              "Clear completed (#{@completedCount()})"

      _ 'footer#info',
        _ 'p',
          'Double-click to edit a todo.'

        _ 'p', 
          _ 'a', href:'http://twitter.com/peterwmwong',
            'Peter Wong'

        _ 'p',
          'Part of '
          _ 'a', href:'http://todomvc.com',
            'TodoMVC'
    ]

    onHashChange: ->
      @set 'filter',
        switch window.location.hash
          when '#/active' then false
          when '#/completed' then true
          else  null
      return

    incompleteCount: ->
      (@todos.filterBy done: false).length

    clearCompleted: ->
      @todo.$delete() for todo in (@todos.filterBy done: true)
      return

    completedCount: ->
      @todos.length() - @incompleteCount()

  new App()
