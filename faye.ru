require 'faye'
require 'faye/redis'

class ServerAuth
  def incoming(message, callback)
    puts "*****************"
    puts message['data']
    callback.call(message)
  end
end


bayeux = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
bayeux.add_extension(ServerAuth.new)
bayeux.listen(9292)
