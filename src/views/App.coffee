define [
  'models/TodoList'
  'cell!./Todo'
  'cell!./Stats'
  '__'
], (TodoList, Todo, Stats, __)->

  initialize: ->
    @todos = new TodoList()

  render_el: -> [
    __ 'h1', 'Todos'

    __ '.content',
      __ '#create-todo',
        @$input = __.$ 'input#new-todo',
          placeholder: 'What needs to be done?',
          type: "text",

    __ '#todos',
      @$todo_list = __.$ 'ul#todo-list'

    __ Stats, model: @todos
  ]

  after_render: ->
    # When these events happen on the TodoList collection, call the following
    # methods on this object:
    @todos.bind 'add', @addOne, @
    @todos.bind 'reset', => @todos.each @addOne, @
    @todos.fetch()

  events:
    "keypress #new-todo": (e)->
      if (text = @$input.val()) and e.keyCode is 13
        @todos.create
          text: text
          done: false
          order: @todos.nextOrder()

        @$input.val ''

  addOne: (todo)->
    @$todo_list.append __ Todo, model: todo
