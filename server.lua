local socket = require("socket")

host = "127.0.0.1"
port = 50234

udp = assert(socket.udp())
assert(udp:setsockname(host, port))
assert(udp:settimeout(5))
ip, port = udp:getsockname()

print("Waiting packets on " .. ip .. ":" .. port .. "...")
while true do
	dgram, ip, port = udp:receivefrom()
	if dgram then
		print("Echoing '" .. dgram .. "' to " .. ip .. ":" .. port)
		udp:sendto(dgram, ip, port)
	else
        print(ip)
    end
end
