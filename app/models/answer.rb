# frozen_string_literal: true

class Answer < ApplicationRecord
  has_many :faqs_resourceable, as: :resourceable, dependent: :destroy
end
