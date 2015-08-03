class Forwarder < ActiveRecord::Base
  belongs_to :domain

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
