require('pry')

require_relative('../models/user.rb')

User.delete_all()

user1 = User.new({
  "name" => "Paul",
  "net_monthly_income" => 1_610.67,
  "monthly_budget" => 1_050.00
  })

user1.save()

user1.name = "John"
user1.net_monthly_income = 1_790.88
user1.monthly_budget = 1_000.00
user1.update()

binding.pry
nil
