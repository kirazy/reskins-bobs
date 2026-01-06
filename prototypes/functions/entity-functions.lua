-- Setup the function host for applying reskins
if not reskins.lib.apply_skin then
	reskins.lib.apply_skin = {}
end

-- Bob's Assembly
require("entities.assembly.assembling-machine")
