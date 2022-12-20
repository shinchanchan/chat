class User < ApplicationRecord

   has_many :messagetexts
   has_secure_password

end
