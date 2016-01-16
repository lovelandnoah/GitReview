if Rails.env.development? || Rails.env.test?
	begin
		github = YAML.load_file('config/github.yml')
		github.each { |key, value| ENV[key] = value }
	rescue
		raise 'github.yml is not found'
	end
end