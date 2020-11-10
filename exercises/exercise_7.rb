require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3}
  validates :annual_revenue, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :mens_apparel, inclusion: { in: [true, false] }
  validates :womens_apparel, inclusion: { in: [true, false] }
  validate :mens_apparel_and_womens_apparel_cannot_be_both_false

  private
  def mens_apparel_and_womens_apparel_cannot_be_both_false
    if mens_apparel == false && womens_apparel == false
      errors.add(:mens_apparel, "can't be false if womens_apparel is false")
    end
  end
end

class Employee < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200}
  validates :store_id, presence: true
end

puts "enter store name:"
store_name = gets.chomp
store = Store.create(name: store_name, annual_revenue: 100000, mens_apparel: false, womens_apparel: false)
puts store.errors.messages