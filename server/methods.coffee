Meteor.methods
  suma: ->
    total = 0
    total += n for n in arguments
    console.log "Suma => ", total
    total
    
    