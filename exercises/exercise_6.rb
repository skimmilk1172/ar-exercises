require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
end

class Employee < ActiveRecord::Base
  belongs_to :store
end

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "Lebron", last_name: "James", hourly_rate: 10)
@store1.employees.create(first_name: "Bill", last_name: "Clinton", hourly_rate: 50)
@store1.employees.create(first_name: "Fred", last_name: "Vanvleet", hourly_rate: 30)

@store2.employees.create(first_name: "Peter", last_name: "Griffin", hourly_rate: 50)
@store2.employees.create(first_name: "Brad", last_name: "Stevens", hourly_rate: 40)
@store2.employees.create(first_name: "Drew", last_name: "Holla", hourly_rate: 20)
@store2.employees.create(first_name: "Tiger", last_name: "Woods", hourly_rate: 100)