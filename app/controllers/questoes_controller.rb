class QuestoesController < ApplicationController
  # GET /questoes
  # GET /questoes.json
  def index
    @questoes = Questao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questoes }
    end
  end

  # GET /questoes/1
  # GET /questoes/1.json
  def show
    @questao = Questao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questao }
    end
  end

  # GET /questoes/new
  # GET /questoes/new.json
  def new
    @questao = Questao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questao }
    end
  end

  # GET /questoes/1/edit
  def edit
    @questao = Questao.find(params[:id])
  end

  # POST /questoes
  # POST /questoes.json
  def create
    @questao = Questao.new(params[:questao])

    respond_to do |format|
      if @questao.save
        format.html { redirect_to @questao, notice: 'Questao was successfully created.' }
        format.json { render json: @questao, status: :created, location: @questao }
      else
        format.html { render action: "new" }
        format.json { render json: @questao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questoes/1
  # PUT /questoes/1.json
  def update
    @questao = Questao.find(params[:id])

    respond_to do |format|
      if @questao.update_attributes(params[:questao])
        format.html { redirect_to @questao, notice: 'Questao was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @questao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questoes/1
  # DELETE /questoes/1.json
  def destroy
    @questao = Questao.find(params[:id])
    @questao.destroy

    respond_to do |format|
      format.html { redirect_to questoes_url }
      format.json { head :ok }
    end
  end
end
