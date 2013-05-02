# routes

module.exports = (app) ->
  app.get '/', require('./home')
  app.get '/base', require('./base')
  app.get '/p/:id', require('./point')
  app.get '/tag/:tag', require('./tag')
  app.get '/category/:category', require('./category')
  