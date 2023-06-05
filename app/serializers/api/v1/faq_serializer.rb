# frozen_string_literal: true

class Api::V1::FaqSerializer < Api::V1::BaseSerializer
  attributes %i[intent questions]

  def attributes *attrs
    super.slice(*fields_custom[:faqs])
  end

  ROOT = {
    faqs: %i[intent questions]
  }.freeze
end
