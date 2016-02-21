class Library < ActiveRecord::Base
  has_one :address
  validates_presence_of :name
  after_initialize :create_address

  private
    def create_address
      self.address = Address.new if self.new_record?
    end
end
