class CreatePageViews < ActiveRecord::Migration[5.2]
  def change
    create_table :page_views do |t|
    	t.references :visit, foreign_key: true
      t.bigint "visit_id"
	    t.string "title"
	    t.string "position"
	    t.text "url"
	    t.string "time_spent"
	    t.decimal "timestamp", precision: 14, scale: 3
      t.timestamps
    end
  end
end
