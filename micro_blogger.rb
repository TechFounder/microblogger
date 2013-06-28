require 'jumpstart_auth'

class MicroBlogger
	attr_reader :client

	def initialize
		puts "initializing..."
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		@client.update(message)
		#if message.length > 140
	end

	def run
		puts "Welcome to the JSL Twitter CLient!"
		command = ""
		while command != "q"
			printf "enter command: "
			command = gets.chomp
			case command
				when 'q' then puts "Goodbye!"
				when 't' then printf "What's your message? "
					message = gets.chomp
					tweet(message)
					puts "OK, done!"
					break
				else
					puts "Sorry, I dont; know to to #{command}"
			end	
		end		
	end	
end

blogger = MicroBlogger.new
blogger.run