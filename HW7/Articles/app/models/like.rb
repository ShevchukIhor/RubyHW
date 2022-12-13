# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :author
  belongs_to :likeable, polymorphic: true

  validates :author_id, uniqueness: true
end