class AddIndexToTodo < ActiveRecord::Migration[7.1]
  def change
    add_column :todos, :sort_number, :integer
  end
end
