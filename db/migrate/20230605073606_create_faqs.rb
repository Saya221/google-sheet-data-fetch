class CreateFaqs < ActiveRecord::Migration[7.0]
  def change
    create_table :faqs do |t|
      t.integer :type, default: Faq.types[:other]
      t.string :intent
      t.text :questions

      t.timestamps
    end
  end
end
