local _M_ = {}

local luabased = require("luabased")
local logging = require("lllogger")

local logger = logging.getLogger(...)
_M_.logger = logger

--- Return an OpScript user attribute.
--- If not found return the default_value.
---
--- OpScript user attribute are not assumed to be multi-sampled.
--- @param name string attribute location (don't need the <user.>)
--- @param default any to return if user attr not found.
--- @return table|any table of value on attribute or default value
function _M_.getUserAttrValue(name, default)

  local argvalue = Interface.GetOpArg(string.format("user.%s", name))

  if argvalue then
    return argvalue:getNearestSample(0)

  else
    return default

  end

end

--- Get the given attribute on the currently visited location.
--- Raise an error is nil result is found.
--- @param attr_path string path of the attribute on the location
--- @return DataAttribute
function _M_.getAttr(attr_path)

  local lattr = Interface.GetAttr(attr_path)

  if not lattr then
    luabased.raising.errorc(
        "[getAttr] Attr <",
        attr_path,
        "> not found on location ",
        Interface.GetInputLocationPath()
    )
  end

  return lattr

end

--- Returned a non-instanced version of the DataAttribute given in arg.
--- @param dataattribute string|DataAttribute DataAttribute instance or name of the DataAttribute class
--- @return DataAttribute DataAttribute class not instanced
function _M_.getAttributeClass(dataattribute)

  if dataattribute == "IntAttribute" or Attribute.IsInt(dataattribute) == true then
    return IntAttribute
  elseif dataattribute == "FloatAttribute" or Attribute.IsFloat(dataattribute) == true then
    return FloatAttribute
  elseif dataattribute == "DoubleAttribute" or Attribute.IsDouble(dataattribute) == true then
    return DoubleAttribute
  elseif dataattribute == "StringAttribute" or Attribute.IsString(dataattribute) == true then
    return StringAttribute
  else
    luabased.raising.errorc(
        "[getAttributeClass] passed class type <",
        dataattribute,
        "> is not supported."
    )
  end
end

return _M_