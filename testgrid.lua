local coolgrid = require("coolgrid2")

local mygrid = coolgrid(10)

mygrid[2][1] = "hello"

print(mygrid[2][1])

print(mygrid[12][0])
