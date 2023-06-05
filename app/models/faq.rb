# frozen_string_literal: true

class Faq < ApplicationRecord
  has_many :faqs_resourceables, dependent: :destroy
  has_many :buttons, through: :faqs_resourceables
  has_many :answers, through: :faqs_resourceables

  enum type: %i[other trader giga invest]
end
