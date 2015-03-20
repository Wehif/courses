jQuery ->
# Destroy comment
  $(document)
  .on "ajax:beforeSend", ".photo", ->
    $(this).fadeTo('fast', 1)
    $(this).hide('fast')
  .on "ajax:success", ".photo", ->
    $(this).hide('fast')
  .on "ajax:error", ".photo", ->
    $(this).fadeTo('fast', 1)