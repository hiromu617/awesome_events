Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, "900a59b74afbb55e21ee", "e79b57c7dc58f08af63faf3e192386991ce203b4"
  else
    provider :github,
      Rails.application.credentials.github[:client_id]
      Rails.application.credentials.github[:client_secret]
  end
end