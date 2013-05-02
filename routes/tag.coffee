# Tag Controller

module.exports = (req, res) ->
  tag = req.params.tag
  tags = req.app.locals.tags
  if tags[tag]
    res.render('tag')
  else
    res.status(404).render("404")
