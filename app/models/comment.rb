class Comment < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  def self.descending
  	order(:created_at => :desc)
  end
end
