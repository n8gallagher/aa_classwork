class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, unique: true, null: false
      t.string :short_url, unique: true
      t.timestamps
    end
    add_index(:shortened_urls, :long_url )
  end
end
