class Api::V1::TodosController < ApplicationController
  before_action :set_todo, only: %i[ show update destroy renumber_sort ]

  # GET /todos
  def index
    @todos = Todo.all

    render json: @todos
  end

  # GET /todos/1
  def show
    render json: @todo
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy!
  end

  def renumber_sort

    update_items = Todo.where("sort_number >= #{params['sort_number']}").order(:sort_number)

    update_items.each do |item| 
      item.update_column(:sort_number, item.sort_number + 1)
    end

    @todo.update(sort_number: params['sort_number'])

    items = Todo.order(:sort_number)
    items.each_with_index do |item, index|
      item.update_column(:sort_number, index + 1)
    end
    render json: 'success', status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :description, :sort_number)
    end
end
