class MegaGreeter

	attr_accessor :names

	def initialize( names = nil )
		@names = names
	end
	
	def say_hi
		
		if @names.nil?
			puts "There are no names !"
					
		elsif @names.respond_to?("each")
		
			@names.each do |name|
				puts "Hi, #{name} !"
			end
			
		else
			puts "Hi last, #@names !"
		end	
		
	end
	
	def say_bye
		
		if @names.nil?
			puts "There are no names."
			
		elsif @names.respond_to?("join")
			puts "Bye #{ @names.join(", ") } !"
			
		else
			puts "Bye #@names"
		end	
			
		
	end
	

end

names = ["Zandor","Lesha","Reshi"]
mg_1 = MegaGreeter.new
mg_1.names = names

mg_1.say_hi
mg_1.say_bye
