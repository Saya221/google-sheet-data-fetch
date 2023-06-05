# frozen_string_literal: true

class Api::V1::ButtonSerializer < Api::V1::BaseSerializer
  attributes %i[payload title]

  def attributes *attrs
    super.slice(*fields_custom[:buttons])
  end

  def payload
    object.button_action
  end

  def title
    object.button_name
  end

  ROOT = {
    buttons: %i[payload title]
  }.freeze
end
