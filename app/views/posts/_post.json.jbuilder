json.extract! post, :id, :title, :description, :image, :community_participant_id, :created_at, :updated_at
json.url post_url(post, format: :json)
json.image url_for(post.image)
