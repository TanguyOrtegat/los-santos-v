RegisterNetEvent('lsv:updatePlayerSkin')
AddEventHandler('lsv:updatePlayerSkin', function(skinIndex, category)
	local player = source
	if not PlayerData.IsExists(player) then
		return
	end

	local skin = Settings.skins[category][skinIndex]

	if skin.rank and PlayerData.GetRank(player) < skin.rank then
		return
	end

	if skin.prestige and PlayerData.GetPrestige(player) < skin.prestige then
		return
	end

	Db.UpdateSkinModel(player, skin.id, function()
		TriggerClientEvent('lsv:playerSkinUpdated', player, skin.id)
	end)
end)
