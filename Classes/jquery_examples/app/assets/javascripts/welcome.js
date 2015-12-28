$(document).ready(function(){
  // say hello button logic
  $('#say_hello').click(function(){
    alert('Hello Button clicked!');
  });

  // sow info div button logic
  $('.show_info_div').click(function(){
    // remove class way
    //$('.info_div').removeClass('hide');

    // slideToggle way
    $('.info_div').slideToggle('slow', function(){
      if($('.info_div').is(':hidden')){
        $('.show_info_div').text('Show Info');
      } else {
        $('.show_info_div').text('Hide Info');
      }
    });

    // .show() way
    //$('.info_div').show();

    // toggleClass way
    //$('.info_div').toggleClass('hide');
  });

  $('#change_background').click(function(){
    // add class
    // $('body').addClass('blue-background');

    // toggleClass
    $('body').toggleClass('blue-background');

    // .css -not best practice
    // $('body').css('background-color', 'blue');
  });

  $('h1').text('modified by jQuery').slideUp(2000).css('color', 'red').slideDown(2000);

  $('#name').keyup(function(e){
    if(e.keyCode == 74)
      alert('you pressed a j');
    $('#live_name').text($(this).val());
  });

  $('#birthdate').change(function(){
    var pickedDate = Date.parse($(this).val());
    var ageDifMs = Date.now() - pickedDate;
    var ageDate = new Date(ageDifMs);
    var calculatedAge = Math.abs(ageDate.getUTCFullYear() - 1970);

    $('#live_age').text('You are ' + calculatedAge + ' years old');
  });
  
  $('#state').change(function(){
    $('#state_info').text("And you live in: " + $(this).val());
  });

  $('#user_form').submit(function(e){
    e.preventDefault();
  });

  $('#user_list_button').click(function(){
    // Get value of text input
    var userInput = $('#user_input').val().trim();
    if(userInput.length) {
      // Append new list item with text input value
      $('#users_list').append('<li>' + userInput + '</li>');
  
      // Clear out the input value
      $('#user_input').val('');
    } else {
      alert('blank input not allowed!');
    }
  });

  $('#clear_list_button').click(function(){
    $('#users_list').empty();
  });

});











