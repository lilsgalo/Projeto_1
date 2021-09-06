class ProjetosController < ApplicationController
  before_action :authenticate_user!
  before_action :get_empresa
  before_action :set_projeto, only: %i[ show edit update destroy ]

  def index
    @projetos = Projeto.all
  end

  def show
  end

  def new
    @projeto = @empresa.projetos.build
  end

  def create
    @projeto = @empresa.projetos.build projeto_params
    if @projeto.save
      flash[:notice] = "Projeto criado"
      redirect_to empresa_path(@empresa)
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @projeto.update projeto_params
      flash[:notice] = "Projeto atualizado"
      redirect_to empresa_path(@empresa)
    else
      redirect_to :edit
    end
  end

  def destroy
    @projeto.destroy
    flash[:notice] = "Projeto apagado"
    redirect_to empresa_path(@empresa)
  end



  private

  def set_projeto
    @projeto = @empresa.projetos.find(params[:id])
  end

  def projeto_params
    params.require(:projeto).permit(:nome, :valor, :descricao, @empresa)
  end

  def get_empresa
    @empresa = Empresa.find(params[:empresa_id])
  end
end