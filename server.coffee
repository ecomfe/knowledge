express = require 'express'
routes = require './routes'
http = require 'http'
path = require 'path'

app = express()

# all environments
app.set 'port', process.env.PORT or 8888
app.set 'views', "#{__dirname}/views"
app.set 'view engine', 'jade'
app.use express.favicon()
app.use express.logger('dev')
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use require('stylus').middleware("#{__dirname}/public")
app.use express.static(path.join(__dirname, 'public'))

# development only
if 'development' == app.get('env')
  app.use express.errorHandler()

# init routes
require('./routes/index.coffee')(app)

http.createServer(app).listen app.get('port'), ->
  console.log 'Listening on port ' + app.get('port')