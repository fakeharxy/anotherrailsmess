class AddLastSeenToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :last_seen, :date
  end
end
