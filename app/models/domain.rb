class Domain < ActiveRecord::Base
  has_many :mailbox, :dependent => :delete_all
  validates :name, presence: true, uniqueness: true
end
