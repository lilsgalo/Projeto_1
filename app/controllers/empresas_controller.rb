class EmpresasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_empresa, only: %i[ show edit update destroy ]


  # GET /empresas or /empresas.json
  def index
    @empresas = Empresa.all
  end

  # GET /empresas/1 or /empresas/1.json
  def show
    @projetos_empresa = @empresa.projetos
    @rhs_empresa = @empresa.rhs
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
    render :edit
  end

  # POST /empresas or /empresas.json
  def create
    @empresa = Empresa.new empresa_params
    if @empresa.save
      flash[:notice] = "Empresa criada"
      redirect_to root_path
    else
      render :new
    end
  end

  # PATCH/PUT /empresas/1 or /empresas/1.json
  def update
    if @empresa.update empresa_params
      flash[:notice] = "Empresa atualizada"
      redirect_to @empresa
    else
      flash[:notice] = "Algo deu errado"
      render :edit
    end
  end

  # DELETE /empresas/1 or /empresas/1.json
  def destroy
    if @empresa.destroy
      flash[:notice] = "Empresa apagada"
      redirect_to root_path
    else
      flash[:notice] = "Algo deu errado"
      redirect_to @empresa
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_empresa
    @empresa = Empresa.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def empresa_params
    params.require(:empresa).permit(:nome, :cnpj, :email, :nome_contato, :email_contato)
  end
end