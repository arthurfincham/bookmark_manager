require 'pg'

class Bookmark
  
  attr_reader :url

  def initialize(url:)
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    result = con.exec( "SELECT * FROM bookmarks" )
    result.map do |bookmark|
      Bookmark.new(url: bookmark['url'])
    end
  end

  def self.create(url:)
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    con.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end

end