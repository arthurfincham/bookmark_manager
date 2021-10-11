require 'pg'

class Manager
  
  attr_reader :all

  def initialize
  end

  def self.all
    con = PG.connect :dbname => 'bookmark_manager', :user => 'arthurfincham'
    result = con.exec( "SELECT * FROM bookmarks" )
    result.map do |bookmark|
      bookmark
    end
  end

  def add_bookmark(bookmark)
    @bookmarks << bookmark
  end
end