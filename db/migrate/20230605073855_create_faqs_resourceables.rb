class CreateFaqsResourceables < ActiveRecord::Migration[7.0]
  def change
    create_table :faqs_resourceables do |t|
      t.references :faq
      t.references :resourceable, polymorphic: true

      t.timestamps
    end
  end
end
