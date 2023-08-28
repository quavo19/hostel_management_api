
class SessionsController < ApplicationController
    def create
      tenant = Tenant.find_by(student_id: params[:student_id])
      
      if tenant && tenant.authenticate(params[:password])
        token = Token.encode({ tenant_id: tenant.id })
        render json: { tenant: tenant, jwt: token }, status: :ok
      else
        render json: { error: 'Invalid Student ID or Password' }, status: :unauthorized
      end
    end
  end