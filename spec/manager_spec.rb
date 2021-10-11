require 'manager'

describe Manager do
  subject(:manager) { described_class.new }

  describe '#all' do
    it 'returns a list of bookmarks' do
      bookmarks = Manager.all
  
      expect(bookmarks.first).to have_value 'http://www.makersacademy.com'

      expect(bookmarks[1]).to have_value "http://www.google.com"
    end
  end

end