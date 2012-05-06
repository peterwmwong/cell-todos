define [
  'models/Todo'
  'helpers/LocalStorage'
], (Todo,LocalStorage)->
  TodoList = Backbone.Collection.extend

    model: Todo

    # Use HTML5 local storage instead of saving models to a web server.
    localStorage: new LocalStorage "TodoList"

    url: '/todos/'

    done: ->
      @filter (todo)-> todo.get('done')

    remaining: ->
      # use "..." operator to expand the done array as an argument list
      @without @done()...

    nextOrder: ->
      if @length is 0 then 1
      else 1 + @last().get 'order'

    comparator: (todo)->
      todo.get 'order'
