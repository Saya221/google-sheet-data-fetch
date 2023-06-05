# frozen_string_literal: true

class Answer < ApplicationRecord
  has_many :faqs_resourceable, as: :resourceable, dependent: :destroy

  scope :by_ids, ->(ids) { where id: ids }
end
