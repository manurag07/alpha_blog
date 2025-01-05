# frozen_string_literal: true

class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
