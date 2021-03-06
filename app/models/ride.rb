class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride

    if (self.user.height.nil? || self.user.tickets.nil? || self.attraction.min_height.nil? || self.attraction.tickets.nil?)
      return "Sorry, you can not take this ride!"
    elsif (self.user.height < self.attraction.min_height) && (self.user.tickets < self.attraction.tickets)
      return "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."

    elsif self.user.tickets < self.attraction.tickets
      return "Sorry. You do not have enough tickets the #{self.attraction.name}."

    elsif self.user.height < self.attraction.min_height
      return "Sorry. You are not tall enough to ride the #{self.attraction.name}."

    else
      self.user.update(tickets: self.user.tickets - self.attraction.tickets)
      self.user.update(nausea: self.user.nausea + self.attraction.nausea_rating)
      self.user.update(happiness: self.user.happiness + self.attraction.happiness_rating)

    end



  end

end
