class User < ActiveRecord::Base
  validates :name,
            :presence => true

  validates :email,
            :presence => true,
            :uniqueness => true,
            :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  validates :phone_number,
            :presence => true,
            :numericality => {:only_integer => true },
            :length => {:in => 7..15 }

  validates :password,
            :presence => { :if => :activated? },
            :format => { :with => /[a-zA-Z]+.*\d+|\d+.*[a-zA-Z]+/, :if => :activated? }
end
