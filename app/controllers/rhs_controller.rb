class RhsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_empresa
  before_action :set_rh, only: %i[ show edit update destroy ]

  def index
    @rhs = Rh.all
  end

  def show
  end

  def new
    @rh = @empresa.rhs.build
  end
  
  def create
    @rh = @empresa.rhs.build rh_params
    if @rh.save
      flash[:notice] = "RH adicionado"
      redirect_to empresa_path(@empresa)
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @rh.update rh_params
      flash[:notice] = "RH atualizado"
      redirect_to empresa_rh_path(@empresa, @rh)
    else
      render :edit
    end
  end

  def destroy
    @rh.destroy
    flash[:notice] = "RH apagado"
    redirect_to empresa_path(@empresa)
  end


  private

  def set_rh
    @rh = @empresa.rhs.find(params[:id])
  end

  def rh_params
    params.require(:rh).permit(:nome, :cpf, :email, :telefone, :idade, :escolaridade, @empresa)
  end

  def set_empresa
    @empresa = Empresa.find(params[:empresa_id])
  end
end
