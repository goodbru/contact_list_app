# require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
	# Step 1: When the app is run with no command, it should display a menu like this.
	


	if  ARGV.empty?
		puts "Here is a list of available commands: "
		puts "new	 - Create a new contact "
		puts "list 	 - List all contacts "
		puts "show 	 - Show a contact "
		puts "search - Search contacts "
	end
		# ARGV.each do |a| 
		# 	puts "#{a}"
		# end
	# def show_menu 

	# 	puts "Here is a list of available commands: "
	# 	puts "new	 - Create a new contact "
	# 	puts "list 	 - List all contacts "
	# 	puts "show 	 - Show a contact "
	# 	puts "search - Search contacts "
	# end
	# show_menu
end
