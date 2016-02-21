class Animal < ActiveRecord::Base
  belongs_to :zoo

  self.inheritance_column = :race

  validates_presence_of :name

  def self.races
    %w(Lion Bear Elephant Monkey)
  end

  def self.lions
    where(race: 'Lion')
  end

  def self.bears
    where(race: 'Bear')
  end

  def self.elephants
    where(race: 'Elephant')
  end

  def self.monkeys
    where(race: 'Monkey')
  end

  def talk
    raise 'You must override this in your sub class and call it there!'
  end
end
