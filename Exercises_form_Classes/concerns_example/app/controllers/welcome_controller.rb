class WelcomeController < ApplicationController
  include DateHelper
  include VaccineHelper
  def index
    @months = DateHelper.months
    @vaccines = VaccineHelper.vaccine_names
    @user1 = User.find(1).decorate
    @user2 = User.find(2).decorate
    @user3 = User.find(3).decorate
    @user4 = User.find(4).decorate
  end
end
