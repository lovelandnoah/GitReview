class User < ActiveRecord::Base
  ################################################################################ 
  ## PeterGate Roles
  ## The :user role is added by default and shouldn't be included in this list.
  petergate(roles: [:admin, :company_admin])
  ################################################################################
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]


	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		  user.email = auth.info.email
		  user.password = Devise.friendly_token[0,20]
		end
	end      
end
