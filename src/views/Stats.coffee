define ['__'], (__)->

  initialize: ->
    @model.on 'all', => @render()

  render_el: -> [
    if @model.length
      __ 'span.todo-count',
        __ 'span.number', remaining = @model.remaining().length
        __ 'span.word', ( if remaining is 1 then ' item' else ' items' ) + ' left'

    if num_done = @model.done().length
      __ 'span.todo-clear',
        __ 'a', { href: "#" }, 'Clear ',
          __ 'span.number-done', num_done
          __ 'span', ' completed'
          __ 'span.word-done', if num_done is 1 then ' item' else ' items'
  ]

  events:
    "click .todo-clear a": -> _.each @model.done(), (todo)-> todo.destroy()
