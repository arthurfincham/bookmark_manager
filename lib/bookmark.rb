require 'pg'

class Bookmark
  
  attr_reader :all

  def initialize
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'arthurfincham'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'arthurfincham'
    end

    result = con.exec( "SELECT * FROM bookmarks" )
    result.map do |bookmark|
      bookmark['url']
    end
  end

  def add_bookmark(bookmark)
    @bookmarks << bookmark
  end
end