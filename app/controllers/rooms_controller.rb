# app/controllers/rooms_controller.rb
class RoomsController < ApplicationController
    def index
      @rooms = Room.all
      render json: @rooms
    end
  
    def show
      @room = Room.find(params[:id])
      render json: @room
    end
  
    def create
      @room = Room.new(room_params)
      if @room.save
        render json: @room, status: :created
      else
        render json: @room.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @room = Room.find(params[:id])
      if @room.update(room_params)
        render json: @room
      else
        render json: @room.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @room = Room.find(params[:id])
      @room.destroy
      head :no_content
    end
  
    private
    def room_params
      params.require(:room).permit(:room_number, :fan, :door, :door_lock, :bulb, :switch_and_socket, :fan_regulator, :bed)
    end
  end
  