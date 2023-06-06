# frozen_string_literal: true

class Yaml::FaqSerializer < BaseSerializer
  attributes %i[intent examples]

  def attributes *attrs
    super.slice(*fields_custom[:faqs])
  end

  def intent
    "faq/#{object.intent}"
  end

  def examples
    object.questions
  end

  YAML_RESP = {
    faqs: %i[intent examples]
  }.freeze
end
