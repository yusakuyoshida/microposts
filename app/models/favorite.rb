class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favoritepost, class_name: "Micropost"
end
