require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks[0]).to have_attributes(:url => 'http://www.makersacademy.com')
      expect(bookmarks[1]).to have_attributes(:url => 'http://www.destroyallsoftware.com')
      expect(bookmarks[2]).to have_attributes(:url => 'http://www.google.com')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.example.org')

      expect(Bookmark.all[0]).to have_attributes(:url => 'http://www.example.org')
    end
  end
end
