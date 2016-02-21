$(document).ready ->
  
  addProduct = ->
    $.ajax '/products/new',
      type: 'GET'
      dataType: 'HTML'
      success: (data) ->
        console.log(data)
        $('#new_product_form').append(data)
      error: (data) ->
        alert('Product not added.')
 
  $(document).on 'click', '#add_product_button', (e) ->
    e.preventDefault()
    addProduct()

  $('#new_product').on 'submit', (e) ->
    e.preventDefault()
    $.ajax '/products',
      type: 'POST'
      data: $('#new_product').serializeArray()
      success: (data) ->
        debugger
        
      error: (data) ->
       alert('Product not added.')








