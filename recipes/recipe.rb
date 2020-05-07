module Recipes
  class Recipe < Contentful::Entry
    def photo_url(**args)
      fields[:photo]&.url(**args)
    end

    def tags_names
      fields[:tags]&.map {|tag| tag.name}
    end

    def chef_name
      fields[:chef]&.name
    end
  end
end