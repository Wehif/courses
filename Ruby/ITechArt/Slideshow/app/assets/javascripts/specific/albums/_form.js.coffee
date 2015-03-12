$ ->
  $('#album_tag_list').select2
    tags: if gon? then gon.tags else []
    tokenSeparators: [","]
    width: '200'