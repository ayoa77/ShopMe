class BraintreeController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
    byebug
if params[:format].present?
    @post = Post.find(params[:format])
  else
    @post = @post
  end
  end
  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
    result = Braintree::Transaction.sale(
     :amount => params[:checkout_form][:amount],
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
    @post = Post.find(params[:checkout_form][:post_id].to_i)
    redirect_to braintree_new_path(@post), :flash => { :error => "Transaction failed. Please try again." }
    end
  end
end
