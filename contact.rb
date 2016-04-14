# require 'pg'
# require 'csv'
# require_relative 'contact_list'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact < ActiveRecord::Base

  # # Code to setup the database. Should only be run once.
  # # Assumes you have a database called namedb.


  # attr_accessor :name, :email, :id, :conn

  # # Creates a new contact object
  # # @param name [String] The contact's name
  # # @param email [String] The contact's email address
  # def initialize(id, name, email)
  #   # TODO: Assign parameter values to instance variables.
  #   @name = name
  #   @email = email
  #   @id = id
  #   @all_array = []
  # end


  # def self.set_connection(conn)
  #   @@conn = conn
  # end

  # def destroy
  #   @@conn.exec_params("DELETE FROM contacts WHERE id = $1::int;", [@id])
  # end

  # def save
  #   @@conn.exec_params("UPDATE contacts SET name = $2, email = $3 WHERE id = $1::int", [@id.to_s, @name, @email])
  # end


  # # Provides functionality for managing contacts in the csv file.
  # class << self

  #   def save(attributes)
  #     @@conn.exec_params("INSERT INTO contacts (name, email) VALUES ($1, $2)", [attributes[:name], attributes[:email]])
  #     #@@conn.exec_params("UPDATE contacts SET name = $1, email = $2 WHERE id = $1::int", [attributes[:id], attributes[:name], attributes[:email]])
  #   end


  #   # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
  #   # @return [Array<Contact>] Array of Contact objects
  #   def all
  #     # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.

  #     result = @@conn.exec("SELECT * FROM contacts")
  #     # CSV.foreach('contacts.csv') do |id,name,email|
  #     all_array = []
  #     result.each_row do |row|
  #       id = row[0]
  #       name = row[1]
  #       email = row[2]
  #       all_array << Contact.new(id,name,email)
  #     end
  #     return all_array
  #   end


  #   # Creates a new contact, adding it to the csv file, returning the new contact.
  #   # @param name [String] the new contact's name
  #   # @param email [String] the contact's email
  #   def create(attributes)
  #     # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
  #     #CSV.open('contacts.csv', 'a+') do |csv|
  #     self.save(attributes)
  #   end

  #   # Find the Contact in the 'contacts.csv' file with the matching id.
  #   # @param id [Integer] the contact id
  #   # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
  #   def find(id)
  #     # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
  #     result = @@conn.exec("SELECT * FROM contacts WHERE id = $1::int", [id])
  #      return result.map { |row| Contact.new row["id"], row["name"], row["email"] }.first
  #     # result.each_row do |row|
  #     #   if id == row[0]
  #     #     return row
  #     #   end
  #     # end

  #   end
  #   # Search for contacts by either name or email.
  #   # @param term [String] the name fragment or email fragment to search for
  #   # @return [Array<Contact>] Array of Contact objects.
  #   def search(word)
  #     # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
  #     # CSV.foreach('contacts.csv') do |row|
  #     #   row.each do |elm|
  #     #     if elm =~ /#{word}/i
  #     result = @@conn.exec("SELECT * FROM contacts WHERE name ilike '%#{word}%'")   #'/%#{word}%/i'
  #     return result.map { |row| Contact.new row["id"], row["name"], row["email"] }
  #   end
  # end
end
