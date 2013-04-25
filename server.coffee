express = require 'express'
http = require 'http'
path = require 'path'
stylus = require 'stylus'
nib = require 'nib'

# template compile
compile = (str, path) ->
  stylus(str)
  .set('filename', path)
  .set('compress', true)
  .use(nib())
  .import('nib')

# create express
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
app.use stylus.middleware
  src: "#{__dirname}/public"
  compile: compile
app.use express.static(path.join(__dirname, 'public'))

# development only
if 'development' == app.get('env')
  app.use express.errorHandler()

# init routes
require('./routes/index.coffee')(app)

http.createServer(app).listen app.get('port'), ->
  console.log 'Listening on port ' + app.get('port')