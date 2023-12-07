class Book
  attr_accessor :title, :author, :year_of_publication

  def initialize(title, author, year_of_publication)
    @title = title
    @author = author
    @year_of_publication = year_of_publication
  end
end

book = Book.new("Harry Potter: Philosopher's Stone", "J. K. Rowling", 1997)
puts book.title
puts book.author
puts book.year_of_publication
