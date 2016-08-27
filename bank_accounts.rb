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

      def deposit
      print "How much would you like to deposit?"
      @deposit_amount = gets.chomp.to_f
      @account_balance = @account_balance + @deposit_amount
      return @account_balance
      end

    def withdrawal(amount)
      @withdrawal = amount.to_f
      fee = 1.00
            if @withdrawal <= 0
            puts "Please enter an amount greater than zero."
            end

            if @withdrawal > @account_balance
              puts "Insufficient funds for transaction"
              exit
            end

      @account_balance = @account_balance - (@withdrawal + fee)
      return @account_balance
    end

    def check_balance
      return @account_balance
    end
  end

  class SavingsAccount < Account

    def initialize(account_id, balance, open_date)
    super
    @inital_balance = 0
    end

    def  begin_balance
      amount = false
      while amount == false
      print "How much will you deposit to open your account?"
      @inital_balance = gets.chomp.to_i
          if @inital_balance < 10.01
          puts "Your intial deposit must be at least $10.00."
          else
          amount = true
          end
          @account_balance = @inital_balance
      end
      return @account_balance
    end

    def withdrawal(amount)
      fee = 2.00
      print "How much would you like to withdraw?"
      @withdrawal = amount.to_f
          if @withdrawal <= 0
            puts "Please enter an amount greater than zero."
          end
          if @withdrawal > @account_balance
          puts "Insufficient funds for transaction. You have #{@account_balance} in your savings account."
          exit
          end
        saving_withdrawal = @withdrawal + fee
        @account_balance = @account_balance - saving_withdrawal
        return @account_balance
      end

    def add_interest(rate)
      @interest = @account_balance * rate / 100
      @account_balance = @account_balance + @interest
      return @interest
    end
  end

  class CheckingAccount < Account




      def withdraw_using_check(amount)
        chk_num = 0

          fee = 1


          @withdrawal = amount
          if @withdrawal > (@account_balance + 10)
              puts "Account overdraw greater than 10.00."
              exit
            else
              @account_balance = @account_balance - (@withdrawal + fee)
              return @account_balance
            end
          chk_num += 1
        
      end
    def reset_checks
      chk_num = 0
      return chk_num
    end

  end

end




# Bank::Account.create_accounts
# Bank::Account.deposit
a1 = Bank::CheckingAccount.new(734848, 500, "3/5/2016")
#a1.withdrawal(400.00)
puts "Your balance is #{a1.withdraw_using_check(300)}"

#puts "You've deposited #{@deposit_amount} and your account balance is #{a1.deposit}."
#puts "Your begining balance is #{a1.begin_balance}."
# puts "Your balance is #{a1.withdrawal(400)}."

#puts "You've earned #{a1.add_interest(0.25)} in interest so far!"
#puts "Your current balance is #{a1.check_balance}."

#puts Bank::Account.all


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
  # def transactions
  #   puts "Welcome to Ada Savings and Loan. What type of transaction would you like to make?"
  #   puts "1. Check my balance \n2. Make a withdrawal \n3. Make a deposit"
  #
  #       while true do
  #             option = gets.chomp
  #
  #
  #             case option
  #               when "1", "Check my balance"
  #                 check_balance
  #                 break
  #               when "2", "Make a withdrawal"
  #                 withdrawal
  #
  #                 break
  #               when "3", "Make a deposit"
  #                 deposit
  #                 check_balance
  #                 break
  #               end
  #       end
  # end
