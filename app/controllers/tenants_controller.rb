class TenantsController < ApplicationController
    def index 
        tenants = Tenants.all
        render json: tenants
    end

    def show 
        tenant = Tenant.find_by(params[:id])
        if tenant
            render json: tenant
          else
            render json: { error: "Tenant not found" }, status: :not_found
        end
    end

    def create
        tenant = Tenant.create(name: params[:name], age: params[:age])
        render json: tenant, status: :created
    end 

    def update
        tenant = Tenant.find_by(id: params[:id])
        if tenant
          tenant.update(tenant_params)
          render json: tenant
        else
          render json: { error: "Tenant not found" }, status: :not_found
        end
    end

    def destroy
        tenant = Tenant.find_by(id: params[:id])
        if tenant
          tenant.destroy
          head :no_content
        else
          render json: { error: "Tenant not found" }, status: :not_found
        end
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end
end
