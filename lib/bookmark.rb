# frozen_string_literal: true

require 'pg'

class Bookmark
  attr_reader :url, :title, :id

  def initialize(url:, title:, id:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    con = if ENV['ENVIRONMENT'] = 'test'
            PG.connect(dbname: 'bookmark_manager_test')
          else
            PG.connect(dbname: 'bookmark_manager')
          end

    result = con.exec('SELECT * FROM bookmarks')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    con = if ENV['ENVIRONMENT'] = 'test'
            PG.connect(dbname: 'bookmark_manager_test')
          else
            PG.connect(dbname: 'bookmark_manager')
          end

    result = con.exec_params("INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, url, title;", [url, title])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end
end
