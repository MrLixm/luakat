local _M_ = {}

local luabase = {}
luabase.formatting = require("luabase.formatting")
local logging = require("lllogger")

local logger = logging:get_logger("katlua.location")
_M_.logger = logger

function _M_.getLocationName(location)
  --[[
  Args:
    location(str): ex: "/root/world/geo/primitive"

  Returns:
    str: name of the location without its hierarchy. ex: "primitive"
  ]]
  local name = luabase.formatting.split(location, "/")
  return name[#name]  -- return the last element of the list
end

return _M_