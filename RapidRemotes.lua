local settings = {repeatamount = 4} --Amount of repeat

local gm = getrawmetatable(game)
setreadonly(gm, false)
local namecall = gm.__namecall
gm.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "FireServer" or method == "InvokeServer" then
		if tostring(self) == "Hit" then --Specify remote to duplicate
			for i = 1,settings.repeatamount do
				namecall(self, unpack(args)) --Start repeating
			end
		end
    end
    return namecall(self, ...)
end)
setreadonly(gm, true)
print("Duplicated!")

-- Known remotes --
-- Fishing sim {MonsterHit}
-- All of us are dead {WeaponHit}
-- WestBound {Hit, Inventory, SkinAnimal}
