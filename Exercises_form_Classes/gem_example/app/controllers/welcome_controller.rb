class WelcomeController < ApplicationController
  def index
    @reversed = WordifyJakesorce.reversify("can you read this?")
    @cased = WordifyJakesorce.casify("I am having problems with my volume")
    @spaced = WordifyJakesorce.spacify("hello", 4)
  end
end
