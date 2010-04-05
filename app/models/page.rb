class Page < ActiveRecord::Base

  belongs_to :book

  searchable do
    integer :book_id, :references => Book #, :trie => true
    text :content
  end

end

