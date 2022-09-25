local _M_ = {}

local luabased = require("luabased")
local logging = require("lllogger")

local logger = logging.getLogger(...)
_M_.logger = logger

--- @param location string ex: "/root/world/geo/primitive"
--- @return string name of the location without its hierarchy. ex: "primitive"
function _M_.getLocationName(location)

  local name = luabased.stringing.split(location, "/")
  return name[#name]  -- return the last element of the list

end

return _M_