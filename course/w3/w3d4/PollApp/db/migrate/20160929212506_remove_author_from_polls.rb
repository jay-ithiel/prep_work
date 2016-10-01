class RemoveAuthorFromPolls < ActiveRecord::Migration
  def change
    remove_column :polls, :author
  end
end
