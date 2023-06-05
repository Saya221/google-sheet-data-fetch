# frozen_string_literal: true

class Api::V1::FaqsResourceable < Api::V1::BaseSerializer
  attributes %i[faq resourceable]

  def attributes *attrs
    super.slice(*fields_custom[:faqs_resourceables])
  end

  def faq
    Api::V1::FaqSerializer.new(object.faq)
  end

  def resourceable
    case resourceable_type
    when Answer.name
      Api::V1::AnswerSerializer.new(object.resourceable)
    else
      Api::V1::ButtonSerializer.new(object.resourceable)
    end
  end

  ROOT = {
    faqs_resourceables: %i[faq resourceable]
  }.freeze
end
