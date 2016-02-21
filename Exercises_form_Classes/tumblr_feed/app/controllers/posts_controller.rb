class PostsController < ApplicationController
  def index
    @posts = tumblr_client.posts(ENV['HOSTNAME'])['posts']
  end
end
