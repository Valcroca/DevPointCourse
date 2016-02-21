class UserDecorator < Draper::Decorator
  delegate_all 

  def full_name
    if self.first_name && self.last_name
      "#{self.first_name} #{self.last_name}"
    elsif self.first_name && !self.last_name
      "#{self.first_name} No Last Name"
    elsif !self.first_name && self.last_name
      "No First Name #{self.last_name}"
    else
      "No First or Last Name"
    end
  end


end