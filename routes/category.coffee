# Category Controller

module.exports = (req, res) ->
  categories = req.app.locals.categories
  sCategoryId = req.params.category
  for categoryId, category of categories
    if categoryId is sCategoryId
      res.render "category", curCategory: category
      return
  res.status(404).render("404")
