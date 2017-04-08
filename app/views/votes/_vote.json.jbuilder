json.extract! vote, :id, :user_id, :userdare_id, :vote_up_or_down, :created_at, :updated_at
json.url vote_url(vote, format: :json)
