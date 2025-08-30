if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_authentication_app", domain: "https://link-to-your-production-app.com/"
else
  Rails.application.config.session_store :cookie_store,
  key: '_auth',
  same_site: :none, # 👈 required for cross-origin
  secure: Rails.env.production? || true
end

# TODO update with URL when in prod