class InterfacesController < ApplicationController
  layout "application"
  layout 'sidenav'

  before_action :set_interface, except: [:index, :create, :new]

  # GET /interfaces
  def index
    @body_class = 'with-sidebar show-sidebar'
    @interfaces = Interface.all
  end

  # GET /interfaces/1
  # def show
  # end

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
    @interface.assign_attributes(user_id: current_user.id, last_responded_at: Time.current)
    if @interface.save
      redirect_to interfaces_path, notice: 'Interface created.'
    else
      render :new
    end
  end

  # PATCH/PUT /interfaces/1
  def update
    @interface.assign_attributes(user_id: current_user.id, last_responded_at: Time.current)
    if @interface.update!(interface_params)
      redirect_to @interface, notice: 'Interface was updated.'
    else
      render :edit
    end
  end

  # DELETE /interfaces/1
  def destroy
    @interface.destroy
    redirect_to interfaces_url, notice: 'Interface was destroyed.'
  end

  def check_pulse
    result = ExternalIPService.new.check_for_life(@interface)
    respond_to do |format|
      format.html {redirect_to interfaces_path}
      format.json do
        render json: {status: result}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interface
      @interface = Interface.find_by(id: params[:id])
      if @interface.nil?
        @interface = Interface.find_by(id: params[:interface_id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def interface_params
      params.require(:interface).permit(:ip, :ddns, :port)
    end
end
