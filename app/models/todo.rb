class Todo < ApplicationRecord
  before_create :assign_index

  def assign_index
    self.sort_number = Todo.all.count + 1
  end

  def drag_drop_sort
    # sort_number_array = Todo.all.pluck(:sort_number)
    # todo_count = (1..Todo.all.count).to_a
    # missing_number = todo_count - sort_number_array
    # Rails.logger.info ">>>>>>>>>>>>>>>>>>>>>>>>>>>>#{sort_number_array}"
    # Rails.logger.info ">>>>>>>>>>>>>>>>>>>>>>>>>>>>#{todo_count}"
    # Rails.logger.info ">>>>>>>>>>>>>>>>>>>>>>>>>>>>#{missing_number}"

    items = Todo.order(:sort_number)
    items.each_with_index do |item, index|
      item.update_column(:sort_number, index + 1)
    end

    # items = Todo.order(:sort_number)
    # sorted_numbers = items.pluck(:sort_number)

    # sorted_numbers.each_with_index do |number, index|
    #   if number != index + 1
    #     items.where(sort_number: number).update_all(sort_number: index + 1)
    #   end
    # end
  end

end
