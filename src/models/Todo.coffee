define [], ()->
  NAUGHTY_WORDS = /crap|poop|hell|frogs|feces/gi

  sanitize = (str)-> str.replace NAUGHTY_WORDS, 'double rainbows'

  Backbone.Model.extend
    defaults: ->
      text: ''
      done:  false
      order: 0

    initialize: ->
      @set {text: sanitize @get 'text'} , silent: true

    validate: (attrs)->
      if attrs.hasOwnProperty('done') and not _.isBoolean(attrs.done)
        return 'Todo.done must be a boolean value.'

    toggle: ->
      @save done: not @get 'done'
