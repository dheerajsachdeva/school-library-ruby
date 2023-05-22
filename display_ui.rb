require_relative 'app'

class DisplayUI
  def initialize(app)
    @app = app
  end

  def list_all_books
    puts 'Books:-'
    @app.list_all_books
  end

  def list_all_peoples
    puts 'Peoples:-'
    @app.list_all_peoples
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    @app.create_book(title, author)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @app.create_teacher(specialization, age, name)
    puts 'Person Created Successfully'
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    print 'Has parent permission? (Y/N): '
    parent_permission = false
    temp = gets.chomp.downcase
    until %w[y n].include?(temp)
      print 'Has parent permission? (Y/N): '
      temp = gets.chomp.downcase
      parent_permission = true if temp == 'y'
    end
    @app.create_student(age, classroom, name, parent_permission)
    puts 'Person Created Successfully'
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    number = gets.chomp
    while number != '1' && number != '2'
      puts 'Do you want to create a student(1) or a teacher(2)? [Input the number 1 or 2 only]: '
      number = gets.chomp
    end
    if number == '1'
      create_student
    else
      create_teacher
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @app.books.each_with_index { |book, index| puts "#{index} Title = #{book.title} Author = #{book.author}" }
    number = gets.chomp.to_i
    puts 'Select a person from the following list by number(not ID)'
    @app.peoples.each.with_index do |person, index|
      puts "#{index}) #{[person.class.name]} Name #{person.name}, ID #{person.id}, Age #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date(YYYY-MM-DD)'
    date = gets.chomp
    @app.create_rental(date, @app.peoples[person_index], @app.books[number])
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of a person: '
    id = gets.chomp.to_i
    person = @app.list_rentals(id)
    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "Date #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
