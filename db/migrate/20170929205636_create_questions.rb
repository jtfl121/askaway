class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :body
      t.references :user

      t.timestamps
    end
  end
end
