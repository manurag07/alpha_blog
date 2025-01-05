# frozen_string_literal: true

class AddUserIdToFeedback < ActiveRecord::Migration[6.0]
  def change
    add_reference :feedbacks, :user, foreign_key: true
  end
end
