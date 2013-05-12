class CreateVines < ActiveRecord::Migration
  def change
    create_table :vines do |t|
      t.string :video_uri
      t.string :vine_id
      t.datetime :tweet_created_at
      t.float :tweet_lat
      t.float :tweet_long
      t.string :tweet_from_user
      t.string :tweet_from_user_id
      t.string :tweet_from_user_name
      t.string :tweet_id
      t.string :tweet_id_str
      t.string :tweet_iso_language_code
      t.string :tweet_profile_image_url
      t.string :tweet_profile_image_url_https
      t.string :tweet_text
      t.text :tweet_json
      t.boolean :tweet_processed, :default => false
      
      t.timestamps
    end
  end
end