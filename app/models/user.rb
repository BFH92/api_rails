class User < ApplicationRecord

devise :database_authenticatable,
       :jwt_authenticatable,
       :registerable,
       jwt_revocation_strategy: JwtDenylist
has_many :articles
has_many :comments
validates :email, :presence => true
end