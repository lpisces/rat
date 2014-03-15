# Be sure to restart your server when you modify this file.

#Rat::Application.config.session_store :cookie_store, key: '_rat_session'
Rat::Application.config.session_store :active_record_store, key: '_rat_session'
