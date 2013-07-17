require 'jumpstart_auth'

class MicroBlogger
	attr_reader :client

	def initialize()
		puts "initializing..."
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		if message.length.to_i > 140
			puts "Please type fewer than 140 characters!"
		else	
			@client.update(message)
		end
	end

	def dm(target, message)
		screen_names = @client.followers.collect { |follower| follower.screen_name}
		if screen_names.include?(target)
			puts "Trying to send #{target} this direct message: "
			puts message
		else
			puts "Sorry, I can only DM people who follow you!"
		end
	end

	def followers_list()
		screen_names = []
		screen_names << followers.collect.each { |follower| follower.screen_name}
		screen_names
	end

	def spam_my_followers(message)
		target = followers_list
		dm(target, message)
	end
		
	def run()
		puts "Welcome to the JSL Twitter CLient!"
		command = ""
		while command != "q"
			printf "enter command (q)uit (t)witter (dm)direct message (spam)followers: "
			command = gets.chomp
			case command
				when 'q' then puts "Goodbye!"
				when 't' then printf "What's your message? "
					message = gets.chomp
					tweet(message)
					puts "OK, done!"
					break
				when 'dm' then print "Who do you want to dm? "
					target = gets.chomp
					print "What's your message? "
					message = gets.chomp
					dm(target, message)
				when 'spam'	then print "What's your message? "
					message = gets.chomp
					spam_my_followers(message)
				else
					puts "Sorry, I dont; know to to #{command}"
			end	
		end		
	end	
end

blogger = MicroBlogger.new
blogger.run