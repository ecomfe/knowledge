# Guide Controller

module.exports = (req, res) ->
  id = req.params.id || 'intro'
  guide = req.app.locals.guides[id]
  if guide
    res.render "guide", guide: guide
  else
    res.status(404).render('404')
