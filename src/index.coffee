#===================#
# Module Dependency
#===================#
http = require("http")
path = require("path")

#===================#
# The App itself
#===================#
express = require("express")
app = express()
server = require("http").createServer(app)

#io = require("socket.io").listen(server)
#io.set('log level', 1)

#===================#
# Express config
#===================#
app.configure ->
  app.set "port", process.env.PORT or 5000
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.cookieParser()
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join(__dirname, "/client/public"))


app.configure "development", ->
  app.use express.errorHandler()


#===================#
# Route management
#===================#
controller_loader = require "./lib/controller_loader"
controller_loader.load(app)

# -- Start da serva!
server.listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")




###
#===================#
# Socket code
#===================#
io.sockets.on "connection", (socket) ->
  fs.readFile "listing.json", "utf8", (err, data) ->
    socket.emit "listing", JSON.parse(data)

  fs.readFile "regions.json", "utf8", (err, data) ->
    socket.emit "regions", JSON.parse(data)
