# Space Controller

spaces = require("#{__dirname}/../data/spaces/config")

module.exports = (req, res) ->
  space = req.params.space
  res.json(spaces)
