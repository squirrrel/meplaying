class CreateIntros < ActiveRecord::Migration
  def change
    create_table :intros do |t|
      t.string :username,:limit => 15
      t.string :password, :limit => 20
    end
  end
end
