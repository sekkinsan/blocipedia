Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
}

#set out appstored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]