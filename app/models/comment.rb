class Comment < ActiveRecord::Base
attr_accessible :goer_id

belongs_to :goer, :class_name => "User"

belongs_to :micropost

validates_uniqueness_of :goer_id

end
	