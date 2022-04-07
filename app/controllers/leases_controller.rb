class LeasesController < ApplicationController

    def create
        lease = Lease.create(rent: params[:rent])
        render json: lease, status: :created
    end 

    def destroy
        lease = Lease.find_by(id: params[:id])
        if lease
          lease.destroy
          head :no_content
        else
          render json: { error: "Lease not found" }, status: :not_found
        end
    end

end
