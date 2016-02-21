$(document).ready ->
  baseUrl = 'http://api.tumblr.com/v2'
  user = 'ValCRoca.tumblr.com'
  api_key = $('#keys').data('key')
  $('#get_posts').on 'click', ->
    $.ajax "#{baseUrl}/blog/#{user}/posts",
      type: 'GET'
      data: api_key: api_key
      dataType: 'jsonp'
      success: (data) ->
        for post in data.response.posts
          $('.posts').append "<li><h2>#{post.title}</h2>#{post.body}</li>"