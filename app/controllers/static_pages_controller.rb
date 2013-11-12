class StaticPagesController < ApplicationController
  def home
    @todolist = current_user.todolists.build if signed_in?
  end

  def help
  end
end
