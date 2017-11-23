class ChargesController < ApplicationController

def create
    #creates a Stripe Customer object, for associating with the charge
    customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        customer: customer.id,
        amount: 15_00,
        description: "BigMoney Membership - #{current_user.email}",
        currency: 'usd'
    )

    current_user.update_attribute(:role, 'premium')

    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again :D"
    redirect_to edit_user_registration_path

 rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
 end

 def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.email}",
      amount: 15_00
    }
  end

  private

  def upgrade_user_role
    @user.role = 'premium'
  end

  def downgrade_user_role
    @user.role = 'standard'
  end

end




