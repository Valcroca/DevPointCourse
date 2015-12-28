$(document).ready(function(){
  var baseURL = 'http://devpoint-ajax-example-server.herokuapp.com/api/v1/';

  function addToList(id, name) {
    return('<li><a class="user_item" href=' + id + '>' + name + '</a><br /><button class="user_edit">Edit</button> - <button class="user_delete">Delete</button></li>');
  }

  $.ajax(baseURL + 'users', {
    type: 'GET', 
    success: function(data){
      // data.users = array
      // iterate data.users
      if (data.users.length) {
        for (var i = 0 ; i < data.users.length; i++) {
          var user = data.users[i];
        //populate users_list element with each users first name
        // use the jquerty append method on users_list
          $('#users_list').append(addToList(user.id, user.first_name));
        }
      } else {
        $('#message_div').text('No users found, please add one').slideToggle();
      }  
    },
    error: function(data){
      debugger;
    }
  });

  $(document).on('click', '.user_delete', function(){
    var $parent = $(this).parent();
    var userId = $parent.find('.user_item').attr('href');
    $.ajax(baseURL + 'users/' + userId, {
      type: 'DELETE',
      success: function(data){
        $parent.slideToggle();
      },
      error: function(data){
        alert('The user was not deleted. Please try again.');
      }
    });
  });

  $(document).on('click', '.user_edit', function(){
    $('#message_div').text('Edit User Mode').slideToggle();
    var $parent = $(this).parent();
    var userId = $parent.find('.user_item').attr('href');

    $.ajax(baseURL + 'users/' + userId, {
      type: 'GET',
      success: function(data){
        $('#create_user_form').slideToggle();
        $('#edit_user_form').slideToggle();

        $('#edit_user_form').submit(function(e){
          e.preventDefault();
          $.ajax(baseURL + 'users/' + userId, {
            type: 'PUT',
            data: $(this).serializeArray(),
            success: function(data){
              $('#edit_user_form')[0].reset();//this index will give us the inner html. you can also do $('#create_user_form input').val('')
              $('#edit_user_form').slideToggle();
              $('#create_user_form').slideToggle();
              $('#message_div').text('Edit User Mode').slideToggle();
            },
            error: function(data){
              alert('form not working');
            }
          });
        });
      },
      error: function(data){
        alert('The user was not updated. Please try again.');
      }
    });
  });

  $(document).on('click', '.user_item', function(e){
    e.preventDefault();
    var userId = $(this).attr('href');
    $.ajax(baseURL + 'users/' + userId, {
      type: 'GET',
      success: function(data){
        var user = data.user;
        $('#user_name').text(user.first_name + ' ' + user.last_name);
        $('#user_phone').text(user.phone_number);
      },
      error: function(data){
        debugger
      }
    });
  });

  $('#create_user_form').submit(function(e){
    e.preventDefault();
    $.ajax(baseURL + 'users', {
      type: 'POST',
      data: $(this).serializeArray(),
      success: function(data){
        $('#users_list').append(addToList(data.user.id, data.user.first_name));
        $('#create_user_form')[0].reset();//this index will give us the inner html. you can also do $('#create_user_form input').val('')
      },
      error: function(data){
        console.log(data);
      }
    });
  });








});