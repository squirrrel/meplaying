require 'digest/sha1'

class Intro < ActiveRecord::Base

  attr_accessible :username, :password


  validates :password, :presence => {:message => 'Please specify a password'},
            :format => {:with => /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*_?).{7,15}$/, :message => 'Please specify a valid password.
                                                                               It should contain 7..15 characters and at least one capital letter'}


  validates :username, :presence => {:message => 'Please specify a username'},
            :format => {:with => /^(?=.*[a-z]).{6,10}$/, :message => 'Please specify a valid username. It should contain 6..10 characters'}


  def self.authenticate(params={})

    web_input = Intro.new
    web_input.username = params[:username]
    web_input.password = params[:password]


    user__found = Intro.find_by_username(params[:username])
    hashed_pass = Digest::SHA1.hexdigest(params[:password])

    arr = []
    arr << Intro.count(:conditions => "password = '#{params[:password]}'")
    arr << Intro.count(:conditions => "username = '#{params[:username]}'")

    #todo: add messages for failures others than validations defined before
    if web_input.valid? && user__found && hashed_pass == user__found.password && arr.each { |num| num == 1 }
      true
    else
      web_input.errors[:username] + web_input.errors[:password]
    end

  end


  def self.privileged?(params={})

    params[:username].include?(/^moskaln$/) ? (true) : false

    # params[:authentication]


  end

end

#todo: find custom css styles
#todo: check whether a user can access other than log_in page by typing in a needed url without their credentials

