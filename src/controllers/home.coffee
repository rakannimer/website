path = require("path")

exports.setup = (app) ->
  # Render the 404 page if no other route matches
  app.use (req, res, next) ->
    res.sendfile(path.join(__dirname, "../client/public/404.html"))

  app.get "/", (req, res) ->
    res.render "home/index",
      env: "dev"
