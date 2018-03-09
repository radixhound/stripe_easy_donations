class DonationsController < ApplicationController
  before_action :compute_donation_metrics

  def index
    @pk = ENV['STRIPE_PK']
  end

  def create
    stripe_amount = params[:amount].to_i * 100
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    donation = Donation.create(
      token: params[:stripeToken],
      email: params[:stripeEmail],
      amount: params[:amount]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: stripe_amount,
      description: "Donation: #{donation.private_id}",
      currency: 'cad'
    )

    redirect_to edit_donation_path(donation)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to donations_path
  end

  def edit
    @donation = Donation.find_by(private_id: params[:id])
  end

  def update
    @donation = Donation.find_by(private_id: params[:id])
    @donation.update(donation_params)
    redirect_to donation_path(@donation.private_id)
  end

  def show
    @donation = Donation.find_by(private_id: params[:id])
  end

  def custom
    @pk = ENV['STRIPE_PK']
    amount = params[:custom_donation][:amount]
    @donation = Donation.new(amount: amount)
  end

  private

  def donation_params
    params.require(:donation).permit(:name, :personal_message)
  end

  def compute_donation_metrics
    @donation_count = Donation.count
    @total_donations = Donation.sum(:amount)
  end
end
