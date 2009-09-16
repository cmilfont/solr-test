require 'pdf/reader'
class Book < ActiveRecord::Base

  has_many :pages, :dependent => :destroy
  has_and_belongs_to_many :authors

  has_attached_file :file
  #validates_attachment_content_type :file, :content_type => ['application/pdf']

  searchable do
    time :published_at
    string :title
    float :price
    text :author_names do
      #authors.each { |author| author.name }
      authors.map { |author| author.name }
    end
  end

  def after_save
    super
    #if self.new_record?
      url = RAILS_ROOT + "/public" + self.file.url
    	receiver = PageTextReceiver.new
      pdf = PDF::Reader.file(url, receiver)
      page_number = 0
      receiver.content.each{|page|
        page_number += 1
        self.pages << Page.new(:content => page, :page => page_number)
      }
      Page.reindex
    #end
  end

end

