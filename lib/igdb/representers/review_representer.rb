# URL path: /reviews/
module Igdb::ReviewRepresenter
  include Igdb::Representer

  property :id # The id of the character.
  property :username # The name of the character.
  property :slug # 
  property :url # 
  property :created_at
  property :updated_at
  property :title
  property :game
  property :category
  property :likes
  property :views
  property :rating_category
  property :platform
  property :video
  property :introduction
  property :content
  property :conclusion
  property :positive_points
  property :negative_points
end