class HomeController < ApplicationController
	def index

  end

  def generate_addr
    @key = Bitcoin::generate_key
    @address = Bitcoin::pubkey_to_address(@key[1])
    @bitcoin_info = BitcoinInfo.create({
                                         :bit_address => @address,
                                         :priv_key => @key[0],
                                         :pub_key => @key[1],
                                         :user_id => current_user.id
                                       })
    if  @bitcoin_info.save
      @bitcoin_inf = BitcoinInfo.where(:user_id => current_user.id)
      respond_to do |format|
        format.html
        format.js  {@bitcoin_inf}
      end
    else
      flash[:danger] = @bitcoin_info.errors.full_messages
    end
  end

  def bit_addr_info
    @bitcoin_inf = BitcoinInfo.where(:user_id => current_user.id)
  end

  def bet_existing
     @bet = Bet.all
  end

  def bet_new
   
  end 

  def bet_create
    @bet = Bet.create({:description => params[:bet][:description],
                       :amount => params[:bet][:amount],
                       :date_of_bet => params[:bet][:date_of_bet],
                       :bet_creater_id => current_user.id
                      })
    if @bet.save
        flash[:success] = "Bet created successfully"
        redirect_to root_url
    else
      flash[:danger] = @bet.errors.full_messages
      redirect_to :bet_new
      #render json:
    end 
  end

  def bet_on
    @bet = Bet.find_by_id(params[:id])
    @bet.betbetween << current_user.id
    @bet.save
  end

end
