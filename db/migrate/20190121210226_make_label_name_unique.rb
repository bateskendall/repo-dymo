class MakeLabelNameUnique < ActiveRecord::Migration[5.2]
  def change
    unique_labels = Label.pluck(:name).uniq.sort
    all_labels = Label.all.map{ |label| label.name }.sort
    raise "Run rake repo_dymo:delete_duplicate_labels before continuing." unless unique_labels == all_labels
    add_index :labels, :name, unique: true
  end
end