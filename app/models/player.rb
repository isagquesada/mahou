class Player < ActiveRecord::Base
  validates_presence_of :name, :nick

  has_many :player_games
  has_many :games, :through => :player_games

  attr_reader :complete_name

  def complete_name
    return "#{self.name} #{self.surname} <em>#{self.nick}</em>"
  end

end
