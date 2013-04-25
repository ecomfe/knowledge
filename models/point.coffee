# Point Model

fs = require 'fs'
coffee = require 'coffee-script'

extend = (target, source) ->
  for own key, value of source
    target[key] = value
  return target


Point = (point) ->
  extend this, point


Point::getSync = (id) ->
  try
    str = fs.readFileSync("#{__dirname}/../points/#{id}.coffee").toString()
    point = coffee.eval str, sandbox: true
  catch e
    console.log e
    return false
  this.reset()
  extend this, point


Point::reset = ->
  for own key of this
    delete this[key]


module.exports = Point