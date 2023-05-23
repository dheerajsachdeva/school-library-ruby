require_relative 'storage'

class Loader
    def initialize(app)
    @storage = Storage.new
    @books = "books.json"
    @rentals = "rentals.json"
    @persons = "peoples.json"
    @app = app
    end

def load_books
books = @storage.file_read(@books) if File.exist?(@books)
if books
books.each do |book| @app.create_book(book["title"], book["author"])
end
end
end


def load_persons
    persons = @storage.file_read(@persons) if File.exist?(@persons)
    if persons
    persons.each do |person| 
        if person["options"] == "1" 
            @app.create_student(person["age"], person["name"], person["permission"])
        else
            @app.create_teacher(person["specialization"], person["age"], person["name"])
    end
    end
    end
end

def load_rentals
    rentals = @storage.file_read(@rentals) if File.exist?(@rentals)
    if rentals
    rentals.each do |rental| @app.create_rental(rental["date"], @app.peoples[rental["p_idx"]], @app.books[rental["b_idx"]])
    end
    end
    end

    def load_all
self.load_books
self.load_persons
self.load_rentals
    end

end
