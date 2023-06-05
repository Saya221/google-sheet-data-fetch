class CreateFaqs < ActiveRecord::Migration[7.0]
  def change
    create_table :faqs do |t|
      t.integer :faq_type, default: Faq.faq_types[:other]
      t.string :intent
      t.text :questions

      t.timestamps
    end
  end
end
