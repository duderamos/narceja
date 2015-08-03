class Mailbox < ActiveRecord::Base
  belongs_to :domain
  belongs_to :format
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  def self.search(query)
    where("username like ?", "%#{query}%")
  end
end
