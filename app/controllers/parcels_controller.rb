class ParcelsController < ApplicationController
  before_action :set_parcel, :require_admin, only: %i[ show edit update destroy ]
  before_action :set_parcel, only: [
    :show,
    :edit,
    :update,
    :destroy,
    :mark_found,
    :mark_paid,
    :mark_in_delivery,
    :mark_delivered
  ]

  # Update parcel status
  def mark_found
    @parcel.update!(status: :found)
    redirect_to parcels_path, notice: "Parcel marked as found"
  end

  def mark_paid
    @parcel.update!(status: :paid)
    redirect_to parcels_path, notice: "Payment verified"
  end

  def mark_in_delivery
    @parcel.update!(status: :in_delivery)
    redirect_to parcels_path, notice: "Parcel is now in  delivery"
  end


  # GET /parcels or /parcels.json
  def index
    @parcels =
    if current_user.admin? || current_user.staff?
      Parcel.all.order(created_at: :desc)
    else
      current_user.parcels.order(created_at: :desc)
    end
  end

  # GET /parcels/1 or /parcels/1.json
  def show
  end

  # GET /parcels/new
  def new
    @parcel = Parcel.new
  end

  # GET /parcels/1/edit
  def edit
  end

  # POST /parcels or /parcels.json
  def create
    @parcel = Parcel.new(parcel_params)
    @parcel.resident = current_user

    if @parcel.save
      respond_to do |format|
        format.html do
          redirect_to parcels_path, notice: "Parcel created successfully."
        end
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parcels/1 or /parcels/1.json
  def update
    respond_to do |format|
      if @parcel.update(parcel_params)
        format.html { redirect_to @parcel, notice: "Parcel was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @parcel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parcel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parcels/1 or /parcels/1.json
  def destroy
    @parcel.destroy!

    respond_to do |format|
      format.html { redirect_to parcels_path, notice: "Parcel was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parcel
      @parcel = Parcel.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def parcel_params
      # params.expect(parcel: [ :tracking_number, :courier, :status, :resident_id, :received_at, :delivered_at ])
      params.require(:parcel).permit(
        :tracking_number,
        :courier,
        :received_at
      )
    end
end
