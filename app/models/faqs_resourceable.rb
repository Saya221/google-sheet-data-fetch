# frozen_string_literal: true

class FaqsResourceable < ApplicationRecord
  belongs_to :faq
  belongs_to :resourceable, polymorphic: true

  scope :by_resourceable_type, -> (type) { where resourceable_type: type}
end
