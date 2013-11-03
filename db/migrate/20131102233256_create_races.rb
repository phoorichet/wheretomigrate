class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.integer :county_id

      t.integer :year

      t.integer :indian
      t.integer :bangladeshi
      t.integer :bhutanese
      t.integer :burmese
      t.integer :cambodian
      t.integer :chinese
      t.integer :filipino
      t.integer :hmong
      t.integer :indonesian
      t.integer :japanese
      t.integer :korean
      t.integer :laotian
      t.integer :malaysian
      t.integer :nepalese
      t.integer :pakistani
      t.integer :srilankan
      t.integer :taiwanese
      t.integer :thai
      t.integer :vietnamese

      t.timestamps
    end
  end
end
