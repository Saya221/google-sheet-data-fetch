# frozen_string_literal: true

class Api::V1::FaqSerializer < Api::V1::BaseSerializer
  attributes %i[intent faq_type buttons answers]

  def attributes *attrs
    super.slice(*fields_custom[:faqs])
  end

  def buttons
    return unless fields_custom[:faqs].include?(:buttons)

    load_buttons

    ActiveModel::Serializer::CollectionSerializer.new(
      @buttons,
      serializer: Api::V1::ButtonSerializer
    )
  end

  def answers
    return unless fields_custom[:faqs].include?(:answers)

    load_answers

    ActiveModel::Serializer::CollectionSerializer.new(
      @answers,
      serializer: Api::V1::AnswerSerializer
    )
  end

  ROOT = {
    faqs: %i[intent faq_type buttons answers]
  }.freeze

  private

  def load_buttons
    @buttons = Button.by_ids(
      object.faqs_resourceables
            .by_resourceable_type(Button.name)
            .pluck(:resourceable_id)
    )
  end

  def load_answers
    @answers = Answer.by_ids(
      object.faqs_resourceables
            .by_resourceable_type(Answer.name)
            .pluck(:resourceable_id)
    )
  end
end
