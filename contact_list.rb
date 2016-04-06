require_relative 'contact'
require 'csv'
# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  # Step 1: When the app is run with no command, it should display a menu like this.



  def self.contact_index
    contact_array = Contact.all
    contact_array.each do |contact|
      puts contact.id + " " + contact.name + " " + contact.email
    end
    puts '---'
    puts "#{contact_array.length} records total"
  end


  def self.new_contact
    print "What is the new contacts first and last name: "
    contact_name = STDIN.gets.chomp
    print "What is the email address: "
    contact_email = STDIN.gets.chomp
    new_row_index = CSV.read('contacts.csv').length + 1
    new_contact = Contact.create(new_row_index,contact_name,contact_email)
  end


  def self.show_contact(id)
    row = Contact.find(id)
    
    if row
      puts row[1] + " " + row[2]
    else
      puts "Not found"
    end
  end



  def self.search_contact(word)
    word_match = 0
    record_match = false
    search_contact = Contact.search(word)

    if record_match == true
      puts row[0] + " " + row[1] + " " + row[2]
      word_match += 1
    end #end-if

    puts '---'
    puts "#{word_match} records total"
  end #end-def

end



if  ARGV.empty?
  puts "Here is a list of available commands: "
  puts "new    - Create a new contact "
  puts "list   - List all contacts "
  puts "show   - Show a contact "
  puts "search - Search contacts "

else
  case ARGV[0]
  when 'list'
    ContactList.contact_index
  when 'new'
    ContactList.new_contact
  when 'show'
    ContactList.show_contact(ARGV[1])
  when 'search'
    ContactList.search_contact(ARGV[1])
  end
end