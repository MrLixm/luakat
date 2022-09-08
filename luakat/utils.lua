local _M_ = {}

local logging = require("lllogger")

local logger = logging:get_logger("katlua.utils")
_M_.logger = logger

function _M_.getKatanaVersion()
  --[[
  Returns:
    num:
      Katana version as a float number like 451.00008
  ]]

  local version = Config.Get("KATANA_VERSION") -- "4.5.1.000008"
  version = version:gsub("%.", "", 2)
  version = tonumber(version)
  return version

end

return _M_