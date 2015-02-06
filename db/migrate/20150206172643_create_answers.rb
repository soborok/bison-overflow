class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string     :content
      t.belongs_to :question
      t.belongs_to :user
      t.datetime   :created_at
      t.datetime   :updated_at
    end
  end
end
