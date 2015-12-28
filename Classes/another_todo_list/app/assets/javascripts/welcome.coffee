$(document).ready ->

  addList = (name, description) ->
    $.ajax '/list_form_template',
      type: 'GET'
      data: 
        id: id
        name: name
        description: description
      dataType: 'HTML'
      success: (data) ->
        $('#create_list_form').append(data)
      error: (data) ->
        alert('List not added.')

