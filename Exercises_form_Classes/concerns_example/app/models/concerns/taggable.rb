module Taggable
  extend ActiveSupport::Concern
  inculded do
    has_many :taggings, as: :taggable, dependent: :destroy
    has_many :tags, through: :taggings, dependent: :destroy
  end

  def tag_names
    tags.map{ |tag| tag.name }
  end

  module ClassMethods
    def print
      'do something cool with the print method'
    end

    #Comment.print
      #class method
    #comment = Comment.first
    #comment.tag_names
      #instance methods
  end
end