module DateHelper 
  extend ActiveSupport::Concern

  def self.months
    ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dec']
  end
end
