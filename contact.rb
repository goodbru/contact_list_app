require 'csv'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact

  attr_accessor :name, :email, :id

  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address
  def initialize(id, name, email)
    # TODO: Assign parameter values to instance variables.
    @name = name
    @email = email
    @id = id
  end

  # Provides functionality for managing contacts in the csv file.
  class << self


    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      all_array = []
      CSV.foreach('contacts.csv') do |id,name,email|
        new_contact = Contact.new(id,name,email)
        all_array << new_contact
      end
      return all_array
    end


    # Creates a new contact, adding it to the csv file, returning the new contact.
    # @param name [String] the new contact's name
    # @param email [String] the contact's email
    def create(id, name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      CSV.open('contacts.csv', 'a+') do |csv|
        new_contact = Contact.new(id,name,email)
        csv << [id, name, email]
      end

    end

    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      CSV.foreach('contacts.csv') do |row|
        if id == row[0]
          return row
        end
      end
         return nil
    end
        # Search for contacts by either name or email.
        # @param term [String] the name fragment or email fragment to search for
        # @return [Array<Contact>] Array of Contact objects.
        def search(word)
          # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
          CSV.foreach('contacts.csv') do |row|
            row.each do |elm|
              if elm =~ /#{word}/i
              end
            end
          end
        end
      end
    end
