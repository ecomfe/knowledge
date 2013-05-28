_ = require 'lodash'

module.exports = (req, res) ->
  tagIds = _.pluck(req.app.locals.tags, 'id')
  tagIndex = _.random(0, tagIds.length - 1)
  tagId = tagIds[tagIndex]
  res.redirect "/tag/#{tagId}"
