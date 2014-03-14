json.array!(@cpanel_settings) do |cpanel_setting|
  json.extract! cpanel_setting, :id, :key, :value
  json.url cpanel_setting_url(cpanel_setting, format: :json)
end
