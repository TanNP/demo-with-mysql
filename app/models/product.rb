class Product < ActiveRecord::Base
	has_many :supplies
	has_many :comment, :dependent => :destroy

	paginates_per 5
end
