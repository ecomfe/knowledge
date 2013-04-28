# routes

module.exports = (app) ->
  app.get '/', require('./home')
  app.get '/p/:id', require('./point')
  app.get '/category/:category', require('./category')
  