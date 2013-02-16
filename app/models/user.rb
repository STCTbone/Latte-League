class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :is_vendor, :last_name, :mobile, :password
end
