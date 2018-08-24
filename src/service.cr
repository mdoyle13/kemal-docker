require "kemal"

get "/" do
  "Hello World!"
end

Kemal.config.logging = false

Kemal.run do |cfg| 
  server = cfg.server.not_nil!
  server.bind_tcp "0.0.0.0", 3000, reuse_port: true
end