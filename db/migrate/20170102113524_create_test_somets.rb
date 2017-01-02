class CreateTestSomets < ActiveRecord::Migration
  def change
    create_table :test_somets do |t|
      t.string :name
      t.string :etc

      t.timestamps

    end
  end
end
