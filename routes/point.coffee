# Point Controller

module.exports = (req, res) ->
  id = req.params.id
  point = req.app.locals.points[id]
  if point
    res.render 'point', point: point
  else
    res.status(404).render('404')