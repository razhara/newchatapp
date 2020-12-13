class CreateMessageLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :message_logs do |t|
      t.string :username
      t.text :body
      t.string :jenis

      t.timestamps
    end
  end
end
