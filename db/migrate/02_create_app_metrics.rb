class CreateAppMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :app_metrics do |t|
      t.string :status
      t.string :count
      t.string :sum
    end
  end
end
