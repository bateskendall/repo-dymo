require "octokit"
require "pry"
require "dotenv/load"

client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
client.user.login

Octokit.labels("elixir-lang/elixir").each do |l|
  client.add_label("bateskendall/repoDymo-helper", l.name, l.color)
end


### Script to delete all labels. ###

#client.labels("bateskendall/repoDymo-helper").each do |l|
#  client.delete_label!("bateskendall/repoDymo-helper", l.name)
#end