class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
