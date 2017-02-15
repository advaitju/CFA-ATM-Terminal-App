balance = 100
change = 20
choice = ''

def deposit( balance, change )
  balance = balance + change
  puts "Balance: #{balance}"
  return balance
end

def withdraw( balance, change )
  balance = balance - change
  puts "Balance: #{balance}"
  return balance
end

def get_input
  puts "ATM : Input 'D' to Deposit | 'W' to withdraw | 'X' to exit:"
  choice = gets.chomp.downcase
  if choice == 'x'
    return false
  end
  return choice
end

while choice = get_input
  if ( choice == 'd' )
    balance = deposit( balance, change )
  elsif ( choice == 'w' )
    if balance >= change
      balance = withdraw( balance, change )
    else
      puts "You have $0 balance. Please deposit more money."
    end
  else
    puts "Please try again."
  end
end
puts "Thank you for using the ATM."
