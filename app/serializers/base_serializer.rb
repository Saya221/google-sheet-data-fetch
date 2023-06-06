# frozen_string_literal: true

class BaseSerializer < ActiveModel::Serializer
  def initialize(object, option = {})
    @fields_custom = self.class.const_get option[:type].present? ? option[:type].upcase : :ROOT
    super
  end

  private

  attr_reader :fields_custom
end
