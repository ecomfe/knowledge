# routes

module.exports = (app) ->
  app.get '/', require('./guide')
  app.get '/guide/:id', require('./guide')
  app.get '/base', require('./base')
  app.get '/p/:id', require('./point')
  app.get '/tag/:tag', require('./tag')
