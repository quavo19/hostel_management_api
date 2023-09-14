# app/controllers/tenants_controller.rb
class TenantsController < ApplicationController
    def index
      @tenants = Tenant.all
      render json: @tenants
    end
  
    def show
      @tenant = Tenant.find(params[:id])
      render json: @tenant
    end

    def edit
      @tenant = Tenant.find(params[:id])
      render json: @tenant
    end
    
    # This action updates the tenant details
    def update
      @tenant = Tenant.find(params[:id])
      
      if @tenant.update(tenant_params)
        render json: { message: 'Tenant successfully updated', tenant: @tenant }, status: :ok
      else
        render json: { error: 'Failed to update tenant', errors: @tenant.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def create
        room = Room.find_by(id: params[:tenant][:room_id])
        if room
          params[:tenant][:room_id] = room.id
        else
          return render json: { error: "Room not found" }, status: :unprocessable_entity
        end
        
        @tenant = Tenant.new(tenant_params)
        @tenant.password = "12345678" # default password
        if @tenant.save
          render json: @tenant, status: :created
        else
          render json: { errors: @tenant.errors.full_messages }, status: :unprocessable_entity
        end
      end
      def destroy
        @tenant = Tenant.find(params[:id])
        
        if @tenant.destroy
          render json: { message: 'Tenant successfully deleted' }, status: :ok
        else
          render json: { error: 'Failed to delete tenant' }, status: :unprocessable_entity
        end
      end

      def request_password_reset
        tenant = Tenant.find_by(email: params[:email])
        if tenant
          tenant.update(password_reset_token: SecureRandom.urlsafe_base64)
          # Here you'd typically send an email to the user with a link containing the token.
          render json: { message: 'Password reset token generated' }, status: :ok
        else
          render json: { error: 'Email not found' }, status: :not_found
        end
      end
      
      def reset_password
        tenant = Tenant.find_by(password_reset_token: params[:token])
        if tenant
          tenant.update(password: params[:password], password_reset_token: nil)
          render json: { message: 'Password reset successfully' }, status: :ok
        else
          render json: { error: 'Invalid token' }, status: :unauthorized
        end
      end
      
      
  
    private
    def tenant_params
        params.require(:tenant).permit(:name, :student_id, :phone_number, :date, :maters_number, :program, :level, :admin, :email, :room_id, :profile_image)
      end      
  end
  