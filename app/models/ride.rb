class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    message = ["Sorry."]

    if self.user.tickets < self.attraction.tickets
      message << "You do not have enough tickets to ride the #{self.attraction.name}."
    end

    if self.user.height < self.attraction.min_height
      message << "You are not tall enough to ride the #{self.attraction.name}."
    end

    if self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
      self.user.tickets -= self.attraction.tickets
      self.user.happiness += self.attraction.happiness_rating
      self.user.nausea += self.attraction.nausea_rating
      self.user.save
      self.save
      message = ["Thanks for riding the #{self.attraction.name}!"]
    end
    message.join(' ')
  end

end
