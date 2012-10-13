class FolderState < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => {:message => " no puede estar vacio"}
  has_many :entry_folders
  has_many :output_folders
end
