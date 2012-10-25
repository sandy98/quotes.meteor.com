Template.quotes.quotes = ->
  Quotes.find {}, {sort: {name: 1}}
    
 
Template.quote.events = {
  'click span': (ev) ->
    #Session.set 'editing', null
    Session.set 'selected', @_id

  'dblclick': (ev) ->
    Session.set 'editing', @_id
    setTimeout ->
     $('input[name=quote-text]').focus()
     0

  'blur': (ev) ->
    Session.set 'editing', null
    
  'keyup input[name=quote-text]': (ev) ->
     switch ev.which
       when 27
         Session.set 'editing', null
       when 13
         console?.log "Update #{@_id} - #{$(ev.target).val()}"
         Meteor.call 'update_quote', @_id, $(ev.target).val()      
         Session.set 'editing', null
         
  'click .delete': (ev) ->
    Session.set 'editing', null
    Meteor.call 'remove_quote', @_id
    
} 

Template.quote.selected = ->
  if Session.equals('selected', @_id) then "quote-selected" else ""
  
Template.quote.is_editing = ->
  Session.equals('editing', @_id)