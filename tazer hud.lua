font_flag = require('moonloader').font_flag
font = renderCreateFont('Giger', 20, font_flag.BOLD)

function main()
	 if not isSampfuncsLoaded() or not isSampLoaded() then return end
	 while not isSampAvailable() do wait(100) end
	 active = 0
	 sampRegisterChatCommand("taz", activatecmd)
	 while true do
			 wait(0)
			 if not isPauseMenuActive() and isPlayerPlaying(playerHandle) then
				 if active == 1 then
					 	renderFontDrawText(font, 'Tazer {19ff00}on', 40, 730, 0xffffffff, false)
					else
						renderFontDrawText(font, 'Tazer {ff704d}off', 40, 730, 0xffffffff, false)
					end
					end
			 end
	 end
	 if active == 1 or active == 0 then
		 sampSendChat('/tazer')
end

function activatecmd()
	if active == 0 then
			active = 1
	else
			active = 0
		end
end
