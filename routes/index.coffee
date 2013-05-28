# routes

module.exports = (app) ->
  app.get '/', require('./start')
  app.get '/base', require('./base')
  app.get '/p/:id', require('./point')
  app.get '/tag/:tag', require('./tag')
