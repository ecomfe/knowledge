# Tag Controller

module.exports = (req, res) ->
  tagId = req.params.tag
  tags = req.app.locals.tags
  tag = tags[tagId]
  if tag
    res.render 'tag', tag: tag
  else
    res.status(404).render("404")
