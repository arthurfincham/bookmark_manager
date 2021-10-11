require 'manager'

describe Manager do
  subject(:manager) { described_class.new }

  describe '#all' do
    it 'returns a list of bookmarks' do
      bookmarks = Manager.all
  
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
    end
  end

end