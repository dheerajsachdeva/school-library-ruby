require_relative "rental"

class Book
attr_accessor :title, :author, :rentals

    def initialize(title, author)
        @title, @author = title, author
        @rentals = []
    end

    def add_rental(date, person)
Rental.new(date, person, self)
    end

end