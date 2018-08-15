class CreateBasicHeroscopes < ActiveRecord::Migration
  def change
    create_table :basic_heroscopes do |t|
      t.string :name
      t.date :date
      t.time :time
      t.float :lat
      t.float :lon
      t.float :tzone
      t.string :ascendant
      t.string :varna
      t.string :vashya
      t.string :yoni
      t.string :gana
      t.string :nadi
      t.string :rashi_adipathi
      t.string :rashi
      t.string :nakshtra
      t.string :nakshtra_adipathi
      t.string :charan
      t.string :yog
      t.string :karan
      t.string :tithi
      t.string :yunja
      t.string :tatva
      t.string :name_alphabet
      t.string :paya
      t.string :birth_place

      t.timestamps null: false
    end
  end
end
