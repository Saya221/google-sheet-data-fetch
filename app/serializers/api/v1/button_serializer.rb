# frozen_string_literal: true

class Api::V1::ButtonSerializer < Api::V1::BaseSerializer
  attributes %i[button_number button_name button_action]

  def attributes *attrs
    super.slice(*fields_custom[:buttons])
  end

  ROOT = {
    buttons: %i[button_number button_name button_action]
  }.freeze
end
