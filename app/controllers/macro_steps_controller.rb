class MacroStepsController < ApplicationController

  require_role ['admin','owner']
  before_filter :load_macro
  
  protected

  def load_macro
    @macro = Macro.find(params[:macro_id], :user => current_user)
  end

  public
  
  def create
    @macro_step = @macro.macro_steps.create( params[:macro_step] )
  end

  def update
    @macro_step = @macro.macro_steps.find( params[:id] )
    @macro_step.update_attributes( params[:macro_step] )
  end

  def destroy
    @macro_step = @macro.macro_steps.find( params[:id] )
    @macro_step.destroy

    flash[:info] = "Macro step removed"
    redirect_to macro_path( @macro )
  end
  
end