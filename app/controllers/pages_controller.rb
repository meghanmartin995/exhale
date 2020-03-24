class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    require "opentok"
    opentok = OpenTok::OpenTok.new ENV['TOKBOX_API_KEY'], ENV['TOKBOX_SECRET_KEY']
    session = opentok.create_session :archive_mode => :always, :media_mode => :routed
    session_id = session.session_id
  end
end
