local _M_ = {}
_M_._VERSION = '1.0.2'
_M_._DESCRIPTION = 'Improve interaction and workflow with the Katana lua API.'
_M_._LICENSE = [[
   Copyright 2022 Liam Collod

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
]]

local _self = (...):gsub('%.init$', '')

_M_.attribute = require(_self .. '.attribute')
_M_.location = require(_self .. '.location')
_M_.utils = require(_self .. '.utils')

return _M_