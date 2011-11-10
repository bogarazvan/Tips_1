class Sibling
  def ask(sib)
    sib.tell
  end
  
  def spy_on(sib)
    sib.secret # will always complain
  end

  protected

  def tell
    secret
  end
  
  private
  
  def secret
    "Charlie tooted"
  end
end

rose  = Sibling.new
ricky = Sibling.new

begin
  puts ricky.tell
rescue
  puts "Ricky will only tell another sibling"
end

begin
  puts rose.spy_on(ricky)
rescue
  puts "Ricky complains when Rose tries to find the secret"
end

puts rose.ask(ricky) # Ricky will tell if Rose asks nicely
