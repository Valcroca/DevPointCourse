class Zoo < ActiveRecord::Base
  has_many :animals
  delegate :lions, :bears, :elephants, :monkeys, to: :animals
end
