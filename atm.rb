def get_input(prompt)
  print prompt
  return gets.chomp
end

class Account
  def initialize(balance, account_holder)
    @balance = balance
    @account_holder = account_holder
  end

  attr_accessor :balance
  attr_accessor :account_holder
end

class Atm
  def initialize(account)
    @account = account
  end

  def withdraw(amount)
    if @account.balance >= amount
      @account.balance = @account.balance - amount
    else
      puts "Insufficient funds. Please deposit more funds."
    end
  end

  def deposit(amount)
    @account.balance = @account.balance + amount
  end

  def interface
    puts "Welcome to FatCats(R) ATM"
    puts "Current balance: $#{@account.balance}"
    while true
      choice = get_input("\nChoose transaction: Input 'D' to deposit | 'W' to withdraw | 'X' to exit: ").downcase
      case choice
      when 'w'
        withdraw(get_input("Amount: ").to_i)
        puts "New balance: #{@account.balance}"
      when 'd'
        deposit(get_input("Amount: ").to_i)
        puts "New balance: #{@account.balance}"
      when 'x'
        break
      else
        puts "Please try again."
      end
    end
    puts "\nThank you for enriching FatCats(R) ATM.\nYour funds support valuable catnip farmers."
  end
end

account = Account.new(500, "Advait")
atm = Atm.new(account)

atm.interface
