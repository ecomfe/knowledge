# Guide Controller

module.exports = (req, res) ->
  id = req.params.id || 'start'
  guide = req.app.locals.guides[id]
  if guide
    res.render "guide", guide: guide
  else
    res.status(404).render('404')
