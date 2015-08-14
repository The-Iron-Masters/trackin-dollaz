class User < ActiveRecord::Base
  has_secure_password
  has_many :expenses

  mount_uploader :csv, CsvParserUploader

  validates :first_name, :email, presence: true
end
