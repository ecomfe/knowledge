# Point Controller

Point = require '../models/point.coffee'

module.exports = (req, res) ->
  id = req.params.id
  p = new Point()
  result = p.getSync(id)
  if result then res.jsonp(p) else res.send('一定是加载的姿势不对！')
