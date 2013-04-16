define (require)->
  x_model = require 'cell/exts/x_model'
  x_class = require 'cell/exts/x_class'

  require('cell/defineView!')

    renderEl: (_)->
      _ 'li', (x_class editing:->@get 'editing'),

        _ '.view', ondblclick:@edit,
          _ 'input.toggle', (x_model 'done'), type:'checkbox'
          _ 'label',
            -> @model.get 'text'
          _ 'button.destroy', onclick:->@model.destroy()

        _ 'form', onsubmit:@submit,
          @input =
            _ 'input.edit', (x_model 'text'), type:'text', onblur:@blur

    edit: ->
      @set 'editing', true
      setTimeout (=> @input.focus()), 0
      return

    blur: (e)->
      @set 'editing', false
      return

    submit: (e)->
      e.preventDefault()
      @blur()
      return
