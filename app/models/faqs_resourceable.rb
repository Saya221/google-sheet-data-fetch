# frozen_string_literal: true

class FaqsResourceable < ApplicationRecord
  belongs_to :faq
  belongs_to :resourceable, polymorphic: true
end
