define ['cell/Collection'], (Collection)->
  new Collection do->
    {text:"#{i}",done:false} for i in [1..10]