struct EagleSocket < Amber::WebSockets::ClientSocket

    channel "soar_room:*", SoarChannel

    channel "nest_room:*", NestChannel

  def on_connect
    # do some authentication here
    # return true or false, if false the socket will be closed
    true
  end
end