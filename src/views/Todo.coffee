define ['__'], (__)->

  tagName:  "li"

  initialize: ->
    @$el.addClass('done') if @model.get('done') is true
    @model
      .on('destroy', => @$el.remove())
      .on('change', => @render())

  render_el: -> [
    __ '.display',
      __ 'input.check', do=>
        attrs = type: 'checkbox'
        attrs.checked = 'check' if @model.get('done') is true
        attrs
      __ '.todo-text', text = @model.get 'text'
      __ 'span.todo-destroy'
    __ '.edit',
      @$input = __.$ 'input.todo-input', type: "text", value: text
  ]

  events:
    "click .check": ->
      @model.toggle()
      @$el.toggleClass 'done', @model.get 'done'

    "dblclick div.todo-text": ->
      @$el.addClass 'editing'
      @$input.focus()

    "click span.todo-destroy": -> @model.destroy()

    "keypress .todo-input": (e)-> @close() if e.keyCode is 13

    "blur .todo-input": 'close'

  close: ->
    @model.save text: @$input.val()
    @$el.removeClass 'editing'
