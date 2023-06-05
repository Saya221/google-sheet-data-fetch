# frozen_string_literal: true

namespace :import_csv do
  desc "Import data from CSV"

  @index = 0

  # ANSWERS
  task answers: :environment do
    ActiveRecord::Base.transaction do
      CSV.foreach(ENV["ANSWERS_PATH"], headers: true).each_with_index do |row, i|
        break unless row["Answer Number"]

        Answer.create!(
          answer_number: row["Answer Number"].squish,
          answers: ERB::Util.h(row["Answer"])&.squish&.gsub(/\s+(-|\+)/, " - ")&.squish&.gsub(/\s+-/, "\n-")
        )

        @index = i
        print "\033[32m.\033[0m"
      end
    rescue ActiveRecord::RecordInvalid => e
      puts "\033[31m\nLine: #{@index}, #{e.message}\033[0m"

      raise ActiveRecord::Rollback
    end
  end

  # BUTTONS
  task buttons: :environment do
    ActiveRecord::Base.transaction do
      CSV.foreach(ENV["BUTTONS_PATH"], headers: true).each_with_index do |row, i|
        break unless row["Button Number"]

        Button.create! button_number: row["Button Number"].squish,
                       button_name: row["Button Name"]&.strip&.squeeze,
                       button_action: row["Button Action"]&.strip&.squeeze

        @index = i
        print "\033[32m.\033[0m"
      end
    rescue ActiveRecord::RecordInvalid => e
      puts "\033[31m\nLine: #{@index}, #{e.message}\033[0m"

      raise ActiveRecord::Rollback
    end
  end

  # FAQs
  task faqs: :environment do
    Faq.faq_types.each_key do |faq_type|
      ActiveRecord::Base.transaction do
        CSV.foreach(ENV["FAQ_#{faq_type.upcase}_PATH"], headers: true).each_with_index do |row, i|
          break unless row["Intent"]

          faq = Faq.send(faq_type).create!(
            intent: row["Intent"].squish,
            questions: row["Questions"]&.squish&.gsub(/(-|\+)/, " - ")&.squish&.gsub(/\s+-/, "\n-")
          )
          # Get all number after underscore _
          regex = /(?<=_)\d+/
          # Link answers
          row["Answer"]&.scan(regex)&.each do |id|
            faq.faqs_resourceables.create!(resourceable: Answer.find_by!(id:))
          end
          # Link buttons
          row["Related button"]&.scan(regex)&.each do |id|
            faq.faqs_resourceables.create!(resourceable: Button.find_by!(id:))
          end

          @index = i
          print "\033[32m.\033[0m"
        end
      rescue ActiveRecord::RecordInvalid => e
        puts "\033[31m\nLine: #{@index}, #{e.message}\033[0m"

        raise ActiveRecord::Rollback
      end
    end
  end
end
