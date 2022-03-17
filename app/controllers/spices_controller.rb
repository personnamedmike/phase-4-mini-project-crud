class SpicesController < ApplicationController

    def index
        spice = Spice.all
        render json: spice, status: :ok
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        # byebug
        spice = find_spice
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: { error: "Spice not found"}, status: :not_found
        end
    end

    def destroy
        spice = find_spice
        if spice
            spice.destroy
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end


    private

    def find_spice
        Spice.find_by(id: params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
