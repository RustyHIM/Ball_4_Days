# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'digest'
class User < ActiveRecord::Base

	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation, :city, :bio
	
	has_many :microposts, :dependent => :destroy
	has_many :relationships, :foreign_key => "follower_id",
							:dependent => :destroy
	has_many :comments, :foreign_key => "goer_id",
						:dependent => :destroy
	
	has_many :attending, :through => :comments, :source => :goer
									  
	has_many :following, :through => :relationships, :source => :followed
	
	has_many :reverse_relationships, :foreign_key => "followed_id",
									 :class_name => "Relationship",
									 :dependent => :destroy
	
	has_many :followers, :through => :reverse_relationships, :source => :follower
	
	email_regex= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :name,  :presence        => true,
					  :length          => { :maximum => 50 }
					  
	validates :email, :presence        => true,
					  :format          => { :with => email_regex },
					  :uniqueness      => { :case_sensitive => false }
					  
	validates :password, :presence     => true,
						 :confirmation => true,
						 :length       => { :within => 6..40 }
	validates :bio, :length => { :maximum => 40 }
						 
	before_save :encrypt_password
	
	
	def attending?(goer)
		comments.find_by_goer_id(goer)
	end
	
	def attend!(goer)
		comments.create!(:goer_id => @micropost)
	end
	
	def unattend!(goer)
		comments.find_by_goer_id(goer).destroy
	end
	
	
	def feed
		Micropost.from_users_followed_by(self)
	end
	
	def basketball_feed
		Micropost.where(:sport => 'basketball')
	end
	
	def soccer_feed
		Micropost.where(:sport => 'soccer')
	end
	
	def football_feed
		Micropost.where(:sport => 'football')
	end
	
	def austinbasketball_feed
		Micropost.where(:sport => 'basketball', :city => 'Austin')
	end
	
	def atlantabasketball_feed
		Micropost.where(:sport => 'basketball', :city => 'Atlanta')
	end
	
	def bostonbasketball_feed
		Micropost.where(:sport => 'basketball', :city => 'Boston')
	end
	
	def dcbasketball_feed
		Micropost.where(:sport => 'basketball', :city => 'DC')
	end
	
	def nycbasketball_feed
		Micropost.where(:sport => 'basketball', :city => 'NYC')
	end
	
	def phillybasketball_feed
		Micropost.where(:sport => 'basketball', :city => 'Philadelphia')
	end
	
	def richmondbasketball_feed
		Micropost.where(:sport => 'basketball', :city => 'Richmond')
	end
	
	def wilmingtonbasketball_feed
		Micropost.where(:sport => 'basketball', :city => 'Wilmington')
	end
	
	
	def austinfootball_feed
		Micropost.where(:sport => 'football', :city => 'Austin')
	end
	
	def atlantafootball_feed
		Micropost.where(:sport => 'football', :city => 'Atlanta')
	end
	
	def bostonfootball_feed
		Micropost.where(:sport => 'football', :city => 'Boston')
	end
	
	def dcfootball_feed
		Micropost.where(:sport => 'football', :city => 'DC')
	end
	
	def nycfootball_feed
		Micropost.where(:sport => 'football', :city => 'NYC')
	end
	
	def phillyfootball_feed
		Micropost.where(:sport => 'football', :city => 'Philadelphia')
	end
	
	def richmondfootball_feed
		Micropost.where(:sport => 'football', :city => 'Richmond')
	end
	
	def wilmingtonfootball_feed
		Micropost.where(:sport => 'football', :city => 'Wilmington')
	end


	def austinsoccer_feed
		Micropost.where(:sport => 'soccer', :city => 'Austin')
	end
	
	def atlantasoccer_feed
		Micropost.where(:sport => 'soccer', :city => 'Atlanta')
	end
	
	def bostonsoccer_feed
		Micropost.where(:sport => 'soccer', :city => 'Boston')
	end
	
	def dcsoccer_feed
		Micropost.where(:sport => 'soccer', :city => 'DC')
	end
	
	def nycsoccer_feed
		Micropost.where(:sport => 'soccer', :city => 'NYC')
	end
	
	def phillysoccer_feed
		Micropost.where(:sport => 'soccer', :city => 'Philadelphia')
	end
	
	def richmondsoccer_feed
		Micropost.where(:sport => 'soccer', :city => 'Richmond')
	end
	
	def wilmingtonsoccer_feed
		Micropost.where(:sport => 'soccer', :city => 'Wilmington')
	end

	
	
	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end
	
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end
	
	def self.authenticate_with_salt(id, stored_salt)
		user = find_by_id(id)
		(user && user.salt == stored_salt) ? user : nil
	end
	
	def following?(followed)
		relationships.find_by_followed_id(followed)
	end
	
	def follow!(followed)
		relationships.create!(:followed_id => followed.id)
	end
	
	def unfollow!(followed)
		relationships.find_by_followed_id(followed).destroy
	end
	
	def self.search(search, page)
			paginate :per_page => 10, :page => page,
					 :conditions => ['name like?', "%#{search}%"],
					 :order => 'name'
	end
	
	private
	
	def encrypt_password
		self.salt = make_salt unless has_password?(password)
		self.encrypted_password = encrypt(password)
	end
	
	def encrypt(string)
		string # Only a temporary implemenation!
	end
	
	def make_salt
		secure_hash("#{Time.now.utc}--#{password}")
	end
	
	def secure_hash(string)
		Digest::SHA2.hexdigest(string)
	end
end
