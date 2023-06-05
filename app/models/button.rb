# frozen_string_literal: true

class Button < ApplicationRecord
  has_many :faqs_resourceable, as: :resourceable, dependent: :destroy

  scope :by_ids, ->(ids) { where id: ids }
end
