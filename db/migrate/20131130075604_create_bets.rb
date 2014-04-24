class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :description
      t.string :betbetween, array: true
      t.string :amount
      t.string :winner_id
      t.string :bet_creater_id
      t.date :date_of_bet

      t.timestamps
    end
  end
end
