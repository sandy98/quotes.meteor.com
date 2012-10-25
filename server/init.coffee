require = __meteor_bootstrap__.require
#fs = require 'fs'
#path = require 'path'

Meteor.startup ->
#  base = path.resolve '.'
#  filename = "#{base}/server/data/restarts"

#  restarts = parseInt(fs.readFileSync filename, 'utf8') 
  restarts = SiteData.find().count()     
  console.log "Server start...#{++restarts}"
#  fs.writeFileSync filename, restarts.toString()
  SiteData.insert 'start_time': new Date()
   
  if Quotes.find().count() is 0
    Quotes.insert q for q in the_quotes
  "done"
  
  
  
  
