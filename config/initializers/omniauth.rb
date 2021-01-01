Rails.application.config.middlware.use OmniAuth::Builder do
    provider :facebook, ENV['FB_KEY'], ENV['FB_SECRET']
end