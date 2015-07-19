# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initializeSortable -> ($el)
  $el.sortable(...)
  $el.on 'fields_added.nested_form_fields', (event, param) -> 
    console.log event.target # The added field
    console.log $(this)      # $el

# Listen on document
$(document).on "fields_added.nested_form_fields", (event, param) ->
  switch param.object_class
    when "video"
      console.log "Video object added"
    else
      console.log "INFO: Fields were successfully added, callback not handled."
