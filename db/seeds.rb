require('pry')

require_relative('../models/user.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')

User.delete_all()
Tag.delete_all()
Transaction.delete_all()

user1 = User.new({
  "name" => "Paul",
  "net_monthly_income" => 1_610.67,
  "monthly_budget" => 1_050.00
  })

user1.save()

user2 = User.new({
  "name" => "Jeff",
  "net_monthly_income" => 2_304.23,
  "monthly_budget" => 1_850.00
  })

user2.save()

user1.name = "John"
user1.net_monthly_income = 1_790.88
user1.monthly_budget = 1_000.00
user1.update()

tag1 = Tag.new({
  "category" => "food"
  })
tag1.save()
tag2 = Tag.new({
  "category" => "clothing"
  })
tag2.save()
tag3 = Tag.new({
  "category" => "entertainment"
  })
tag3.save()
tag4 = Tag.new({
  "category" => "travel"
  })
tag4.save()
tag5 = Tag.new({
  "category" => "groceries"
  })
tag5.save()
tag6 = Tag.new({
  "category" => "dining"
  })
tag6.save()

# tag5.category = "household"
# tag5.update()

transaction1 = Transaction.new({
  "merchant_name" => "ASDA",
  "amount" => 13.77,
  "transaction_date" => "2018-02-14",
  "tag_id" => tag5.id,
  "user_id" => user1.id
  })

transaction1.save()

transaction2 = Transaction.new({
  "merchant_name" => "Tinderbox",
  "amount" => 2.50,
  "transaction_date" => "2018-02-02",
  "tag_id" => tag6.id,
  "user_id" => user1.id
  })

transaction2.save()

transaction3 = Transaction.new({
  "merchant_name" => "Aldi",
  "amount" => 29.95,
  "transaction_date" => "2017-12-31",
  "tag_id" => tag5.id,
  "user_id" => user1.id
  })

transaction3.save()

binding.pry
nil
