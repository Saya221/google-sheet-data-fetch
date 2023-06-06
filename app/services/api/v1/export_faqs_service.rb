# frozen_string_literal: true

class Api::V1::ExportFaqsService < Api::V1::BaseService
  def perform
    Faq.faq_types.each_key do |type|
      export_faqs(type)
    end
    export_responses
  end

  private

  def export_faqs(type)
    response = JSON.parse(
      ActiveModel::Serializer::CollectionSerializer.new(
        Faq.send(type),
        serializer: Yaml::FaqSerializer,
        type: :yaml_resp
      ).to_json
    )

    yaml_data = YAML.dump(response)
    file_path = "storage/faq_#{type}.yaml"
    File.open(file_path, "w") { |f| f.puts(yaml_data) }
  end

  def export_responses
    response = JSON.parse(
      ActiveModel::Serializer::CollectionSerializer.new(
        Faq.includes(faqs_resourceables: [resourceable: %i[answers buttons]]),
        serializer: Api::V1::FaqSerializer
      ).to_json
    )

    yaml_data = YAML.dump(transform_hash(response))
    file_path = "storage/responses.yaml"
    File.open(file_path, "w") { |f| f.puts(yaml_data) }
  end

  def transform_hash(response)
    response.map do |res|
      {
        "#{res['faq_type']}_faq/#{res['intent']}" => { "buttons" => res["buttons"] },
        "text" => res["answers"][0]["text"]
      }
    end
  end
end
