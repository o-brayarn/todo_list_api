class Category < ActiveRecord::Base
    has_many :todo_lists
end