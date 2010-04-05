class Book < ActiveRecord::Base

  has_many :pages, :dependent => :destroy
  has_and_belongs_to_many :authors

  has_attached_file :file
  #validates_attachment_content_type :file, :content_type => ['application/pdf']

  searchable do
    time :published_at, :trie => true
    string :title
    float :price #, :trie => true
    text :author_names do
      #authors.each { |author| author.name }
      authors.map { |author| author.name }
    end
  end

end

