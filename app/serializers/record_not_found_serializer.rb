# frozen_string_literal: true

class RecordNotFoundSerializer
  def initialize(error)
    @error = error
    @resource = error.model.underscore
  end

  def serialize
    {
      success: false,
      errors: [
        {
          resource:,
          field: nil
        }.merge(details)
      ]
    }
  end

  private

  attr_reader :error, :resource

  def details
    I18n.t :not_found, scope: %i[errors active_record]
  end
end
