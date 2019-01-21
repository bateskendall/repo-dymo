namespace :repo_dymo do
  desc "TODO"
  task delete_duplicate_labels: :environment do
    duplicates = Label.all - Label.all.uniq{|label| label.name}
    
    duplicates.each do |d|
      d.destroy
    end
  end
end
