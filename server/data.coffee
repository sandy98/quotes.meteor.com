
the_quotes = [
  {contents: 'I find television very educational. Every time someone switches it on I go into another room and read a good book.', author: 'Groucho Marx'}
  {contents: 'Give me a break!', author: 'Anonymous'}
]

SiteData = new Meteor.Collection 'site_data'
Quotes = new Meteor.Collection 'quotes'
 
Quotes.allow = {
    insert: (userId) ->
      if userId then true else false

    update: (userId) ->
      if userId then true else false

    remove: (userId) ->
      if userId then true else false
}


Meteor.publish "quotes", (who) ->
  query = if who then {author: {$regex: who}} else {}
  console.log "Publishing Quotes, length #{Quotes.find(query).count()} at ", new Date 
  Quotes.find query, {sort: {author: 1, contents: 1}}
  

Meteor.methods
  insert_quote: (quote) ->
      console.log "Insert #{JSON.stringify quote}"
      Quotes.insert quote

  update_quote: (quote_id, contents) ->
      console.log "Update #{quote_id} with contents: #{contents}"
      Quotes.update quote_id, $set: {'contents': contents}
    
  remove_quote: (quote_id) ->
      console.log "Delete #{quote_id}"
      Quotes.remove quote_id
    
    
