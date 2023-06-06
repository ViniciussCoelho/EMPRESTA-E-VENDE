json.extract! community, :id, :name, :image, :created_at, :updated_at
json.url community_url(community, format: :json)
json.image url_for(community.image)
