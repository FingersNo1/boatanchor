RegisterCommand("anchor", function()
    local plyPed = PlayerPedId()
    local plyCoords = GetEntityCoords(plyPed)

    if IsPedInAnyBoat(plyPed) then
        local boat = GetVehiclePedIsIn(plyPed, false)

        if GetEntitySpeed(boat) >= 5 then
            Notify('~r~You are going way too fast!')
            return
        end

        if IsBoatAnchoredAndFrozen(boat) then
            SetBoatAnchor(boat, false)
            SetBoatFrozenWhenAnchored(boat, false)

            Notify('~g~Anchor ~b~Detached')  
        else
            SetBoatAnchor(boat, true)
            SetBoatFrozenWhenAnchored(boat, true)

            Notify('~g~Anchor ~y~Attached')        
        end
    else
        Notify('~r~You are not in a boat!')
    end
end, false)

function Notify(message)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(message)
	DrawNotification(0,1)
end

RegisterKeyMapping('anchor', 'Anchor (Boat)', 'keyboard', ']')
