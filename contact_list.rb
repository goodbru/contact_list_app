require 'active_record'
require 'pg'
require_relative './contact'
# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList
  puts "Connecting to the database..."

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  # Step 1: When the app is run with no command, it should display a menu like this.
  # conn = PG::Connection.new(dbname: 'contactdb', host: 'localhost', user: 'vagrant', password: 'password')
  # Contact.set_connection(conn)

  ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    host: "localhost",
    username: "vagrant",
    password: "password",
  database: "contactdb"  )

  puts "Welcome to the Contact List"

  def self.contact_index
    contact_array = Contact.all
    contact_array.each do |contact|
      puts "#{contact.id} #{contact.name} #{contact.email}"
    end
    puts '---'
    puts "#{contact_array.length} records total"
  end


  def self.new_contact
    print "What is the new contacts first and last name: "
    contact_name = STDIN.gets.chomp
    print "What is the email address: "
    contact_email = STDIN.gets.chomp
    # new_row_index = CSV.read('contacts.csv').length + 1
    Contact.create(name: contact_name, email: contact_email)
  end

  def self.update_contact(id)
    contact = Contact.find_by(id: ARGV[1])
    # contact = Contact.find(id)
    print "What is the contacts new first and last name: "
    new_name = STDIN.gets.chomp
    contact.name = new_name
    print "What is the new email address: "
    new_email = STDIN.gets.chomp
    contact.email = new_email
    contact.save
    # puts "#{contact.id} #{contact.name} #{contact.email}"
  end

  def self.show_contact(id)
    contact = Contact.find_by(id: ARGV[1])
    puts "#{contact.id} #{contact.name} #{contact.email}"      # show_array = []
    # result.each_row do |row|
    #     id = row[0]
    #     name = row[1]
    #     email = row[2]
    #     show_array << Contact.search(id)
    # end
    # return show_array
    # if row
    #   puts row[1] + " " + row[2]
    # else
    #   puts "Not found"
    # end
  end

  def self.destroy_contact(id)
    contact = Contact.find(id)
    contact.destroy
    contact.save
  end

  def self.search_contact(word)
    # word_match = 0
    # record_match = false
    contacts = Contact.where("name ILIKE ? OR email ILIKE ?", "%#{word}%", "%#{word}%")

    # if record_match == true
    #   puts row[0] + " " + row[1] + " " + row[2]
    #   word_match += 1
    # end #end-if
    contacts.each { |contact|
      puts "#{contact.id} #{contact.name} #{contact.email}"
    }
    # # puts '---'
    # puts "#{word_match} records total"

  end #end-def
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
    when 'update'
      ContactList.update_contact(ARGV[1])
    when 'destroy'
      ContactList.destroy_contact(ARGV[1])
    end
  end
end
