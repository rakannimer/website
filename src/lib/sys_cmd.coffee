exec = require("child_process").exec

exports.run = (cmd) ->
  child = exec(cmd, (error, stdout, stderr) ->
    console.log "" + stderr  if stderr isnt null
    console.log "" + stdout  if stdout isnt null
    console.log "" + error  if error isnt null
  )
