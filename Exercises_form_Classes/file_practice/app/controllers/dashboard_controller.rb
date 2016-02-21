require 'csv'
class DashboardController < ApplicationController
  def index
  end

  def write
    path = "#{File.expand_path('.')}/tmp/"
    File.open("#{path}#{params[:file][:filename]}", 'wb') do |file|
      begin
        file.write(params[:file][:content])
      rescue => e
        logger.error e.message
      end
    end
    redirect_to :root
  end

  def read
    File.open(params[:file][:uploaded_file].tempfile.path, 'r') do |file|
      begin
        @content = file.read
      rescue => e
        logger.error e.message
      end
    end
    render partial: 'content'
  end

end
