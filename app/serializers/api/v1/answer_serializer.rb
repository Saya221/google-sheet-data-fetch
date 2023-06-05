# frozen_string_literal: true

class Api::V1::AnswerSerializer < Api::V1::BaseSerializer
  attributes %i[answer_number answers]

  def attributes *attrs
    super.slice(*fields_custom[:answers])
  end

  ROOT = {
    answers: %i[answer_number answers]
  }.freeze
end
