class InterfacesController < ApplicationController
  layout "scaffold"

  before_action :set_interface, only: [:show, :edit, :update, :destroy]

  # GET /interfaces
  def index
    @interfaces = Interface.all
  end

  # GET /interfaces/1
  def show
  end

  # GET /interfaces/new
  def new
    @interface = Interface.new
  end

  # GET /interfaces/1/edit
  def edit
  end

  # POST /interfaces
  def create
    @interface = Interface.new(interface_params)

    if @interface.save
      redirect_to @interface, notice: 'Interface was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /interfaces/1
  def update
    if @interface.update(interface_params)
      redirect_to @interface, notice: 'Interface was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /interfaces/1
  def destroy
    @interface.destroy
    redirect_to interfaces_url, notice: 'Interface was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interface
      @interface = Interface.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interface_params
      params.fetch(:interface, {})
    end
end
