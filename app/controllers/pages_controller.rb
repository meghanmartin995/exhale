class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  require "opentok"
  @@opentok = OpenTok::OpenTok.new ENV['TOKBOX_API_KEY'], ENV['TOKBOX_SECRET_KEY']
  def home
    session = @@opentok.create_session :archive_mode => :always, :media_mode => :routed
    @session_id = session.session_id
    gon.session_id = @session_id
    @token = @@opentok.generate_token(@session_id)
    gon.token = @token
    @api_key = session.api_key
    gon.api_key = @api_key
  end
end
