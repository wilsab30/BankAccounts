require "awesome_print"
require "csv"

module Bank

  class Account

    attr_reader :account_number, :account_balance, :account_number, :accounts

    def initialize(account_id, balance, open_date)
      @open_date = open_date
      @account_balance = balance
      @account_id = account_id

    end


    def self.create_accounts
      @@accounts = []
      CSV.open("support/accounts.csv", 'r').each do |line|
        @@accounts << self.new(line[0], line[1].to_i, line[2])
      end
      return @@accounts
    end

    def self.all
      return @@accounts
      end


    def self.find(account_id)
    return @@account_id
    end



    def transactions
      puts "Welcome to Ada Savings and Loan. What type of transaction would you like to make?"
      puts "1. Check my balance \n2. Make a withdrawal \n3. Make a deposit"

          while true do
                option = gets.chomp


                case option
                  when "1", "Check my balance"
                    check_balance
                    break
                  when "2", "Make a withdrawal"
                    withdrawal

                    break
                  when "3", "Make a deposit"
                    deposit
                    check_balance
                    break
                  end
          end
    end



    def deposit
      @account_balance = @account_balance + @deposit_amount
      puts "Thank you for your deposit. Your account balance is #{@account_balance}"
    end

    def withdrawal
      print "How much would you like to withdraw?"
      @withdrawal = gets.chomp.to_f
          if @withdrawal <= 0
            puts "Please enter an amount greater than zero."
          end
          if @withdrawal > @account_balance
          puts "Insufficient funds for transaction"
          exit
          end
    @account_balance = @account_balance - @withdrawal
    puts "You have #{@account_balance.to_f} in your account."
    end

    def check_balance
      puts @account_balance
    end
  end

end

Bank::Account.create_accounts

puts Bank::Account.all

# my_account = Bank::Account.new
# my_account = Bank::Account.find()
  # class Owner
  #
  #   def initialize
  #   end
  #
  #   def UserInfo
  #   end
  #
  # end
