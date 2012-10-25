Template.contents.total = ->
  Quotes.find().count()

Template.contents.events = {
 'keypress input[name=new-quote]': (ev) ->
   return unless ev.which is 13
   newval = $('input[name=new-quote]').val()
   $('input[name=new-quote]').val ''
   bootbox.prompt "Input author's name:", "Cancel", "OK", (author) ->
     Meteor.call('insert_quote', {contents: newval, author: author}, (err, resp) -> console.log resp) unless not author 
   
 'keyup input[name=filter-quote]': (ev) ->
   Session.set 'who', $('input[name=filter-quote]').val()
   
 'click #reset-filter': (ev) -> 
   Session.set 'who', ''
   $('input[name=filter-quote]').val ''
}