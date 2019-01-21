require "dotenv-rails"
Dotenv.load

class GithubLabelCloner

  def initialize(repo)
    @repo_path = repo
    @client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
    @target_repo = {user: "bateskendall", repo: "repo-dymo-labels"}
  end
  
  def clone_github_labels
    repo_labels = Octokit.labels(@repo_path)
    
    repo_labels.map do |label|
      created_label = Label.create(name: label.name, color: label.color, default: label.default)
      @client.add_label(@target_repo, created_label.name, created_label.color)
    end
  end
end