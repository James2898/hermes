class Shop < ApplicationRecord
    has_many :employees, dependent: :destroy
    attr_accessor :first_name, :last_name, :email, :password
end
