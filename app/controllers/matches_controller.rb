class MatchesController < ApplicationController
  # GET /socks/new
  def new
    @sock = Sock.new
  end

  # GET /socks/1/edit
  def edit
  end

  # POST /socks or /socks.json
  def create
    @sock = Sock.new(sock_params)

    respond_to do |format|
      if @sock.save
        format.html { redirect_to @sock, notice: "Sock was successfully created." }
        format.json { render :show, status: :created, location: @sock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /socks/1 or /socks/1.json
  def update
    respond_to do |format|
      if @sock.update(sock_params)
        format.html { redirect_to @sock, notice: "Sock was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @sock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socks/1 or /socks/1.json
  def destroy
    @sock.destroy!

    respond_to do |format|
      format.html { redirect_to socks_path, notice: "Sock was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sock
      @sock = Sock.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sock_params
      params.expect(sock: [ :name, :description, :gender, :age, :height, :color ])
    end

end
