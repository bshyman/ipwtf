
class NotesController < ApplicationController
  before_action :set_interface, only: [:new]

  def index
    interface = Interface.find(notes_params[:interface_id])
    if interface.nil?
      return interfaces_path, error: 'int id missing'
    end
    render partial: 'index', locals: {notes: Note.all, interface: interface}
  end

  def new
    interface = Interface.find(notes_params[:interface_id])
    render partial: 'new', locals: {interface: interface, note: Note.new }
  end

  def create
    results = {}
    note = Note.new(notes_params)
    note.created_by = current_user.id
    if note.save!
      results[:notice] = 'Note saved.'
    else
      results[:notice] = 'Note fail.'
    end
    # redirect_to interfaces_path
    render json: results
  end

  private
  def set_interface
    @interface = Interface.find_by(id: notes_params[:interface_id])
    byebug if @interface.nil?
  end

  def notes_params
    params.permit(:interface_id, :content, :type)
  end
end
