class IntroController < ApplicationController

  layout 'application'

  def index
    log_in
    render('log_in')
  end


  def log_in
    @authentication = Intro.new
  end


  def menu
    creds_test = Intro.authenticate(params[:authentication])
    if  creds_test == true
      render('menu')
    else
     flash[:notice] = creds_test

      redirect_to('/')
    end
  end

end

def logout
  log_in
 # redirect_to('log_in')
end

