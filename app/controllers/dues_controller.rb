# app/controllers/dues_controller.rb
class DuesController < ApplicationController
    def index
      @dues = Due.all
      render json: @dues
    end
  
    def show
      @due = Due.find(params[:id])
      render json: @due
    end
  
    def create
      @due = Due.new(due_params)
      if @due.save
        render json: @due, status: :created
      else
        render json: @due.errors, status: :unprocessable_entity
      end
    end
  
    private
    def due_params
      params.require(:due).permit(:student_id, :amount_paid, :year)
    end
  end
  