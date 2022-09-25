local _M_ = {}

local logging = require("lllogger")

local logger = logging.getLogger(...)
_M_.logger = logger

--- @return number Katana version as a float number like 451.00008
function _M_.getKatanaVersion()

  local version = Config.Get("KATANA_VERSION") -- "4.5.1.000008"
  version = version:gsub("%.", "", 2)
  version = tonumber(version)
  return version

end

return _M_