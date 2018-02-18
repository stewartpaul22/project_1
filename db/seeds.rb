require('pry')

require_relative('../models/user.rb')

User.delete_all()

user1 = User.new({
  "name" => "Paul",
  "net_monthly_income" => 1_610.67,
  "monthly_budget" => 1_050.00
  })

  user1.save()

binding.pry
nil
