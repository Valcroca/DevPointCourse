class WelcomeController < ApplicationController
  def index

  end

  def list_form_template
    @id = params[:id]
    @name = params[:name]
    @description = params[:description]

    render partial: 'list_form_template'
  end
end
