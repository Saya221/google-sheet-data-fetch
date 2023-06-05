# frozen_string_literal: true

class Api::V1::AnswerSerializer < Api::V1::BaseSerializer
  attributes %i[text]

  def attributes *attrs
    super.slice(*fields_custom[:answers])
  end

  def text
    object.answers
  end

  ROOT = {
    answers: %i[text]
  }.freeze
end
