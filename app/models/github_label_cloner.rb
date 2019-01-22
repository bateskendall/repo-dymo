require "dotenv-rails"
Dotenv.load

class GithubLabelCloner

  def initialize(source_repo, username, target_repo)
    @source_repo_path = source_repo
    @client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
    @target_repo_path = {user: username, repo: target_repo}
  end
  
  def clone_github_labels
    repo_labels = Octokit.labels(@source_repo_path)
    
    repo_labels.map do |label|
      created_label = Label.create( name:    label.name, 
                                    color:   label.color, 
                                    default: label.default )
      @client.add_label(@target_repo_path, created_label.name, created_label.color) unless Label.where(name: created_label.name).exists?
    end
  end
end