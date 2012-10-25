
Quotes = new Meteor.Collection 'quotes'

Meteor.autosubscribe () ->
  Meteor.subscribe 'quotes', Session.get 'who'

Meteor.startup ->
  console?.log "Welcome to this beautiful Quotes App!"
  
  $('#ajax-loader').ajaxStart( -> $(@).show())
  $('#ajax-loader').ajaxStop( -> $(@).hide())
  $('.madewith_badge').css position: 'absolute', top: '94%'
  
  Accounts.ui.config passwordSignupFields: 'USERNAME_AND_OPTIONAL_EMAIL'
  
  Session.set 'who', ''
  


