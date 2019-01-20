require "octokit"
require "pry"
require "dotenv/load"

module RepoDymo
  class << self
    
    # Retrieves all issue labels from a given repo. 
    def get_labels(repo)
      Octokit.labels(repo)
    end
    
    # Accepts a list of issue labels and creates them for the target repo.
    def create_labels(labels)
      initialize
      labels.each do |l|
        @client.add_label(@targetRepo, l.name, l.color)
      end
    end

    # Deletes all labels in the target repo.
    def delete_labels
      initialize
      @client.labels(@targetRepo).each do |l|
        @client.delete_label!(@targetRepo, l.name)
      end
    end
  
    private
  
    def initialize
      @client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
      @targetRepo = "bateskendall/repoDymo-helper"
      @client.user.login
    end
  end
end