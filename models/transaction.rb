require_relative('../db/sql_runner')

class Transaction

  attr_reader :id
  attr_accessor :merchant_name, :amount, :transaction_date, :tag_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
    @amount = options['amount']
    @transaction_date = options['transaction_date']
    @tag_id = options['tag_id'].to_i
  end

end
