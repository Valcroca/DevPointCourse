class WelcomeController < ApplicationController
  def index
    @cellphones = Cellphone.all
  end
end
