font_flag = require('moonloader').font_flag
font = renderCreateFont('Giger', 20, font_flag.BOLD)
local sampev = require 'lib.samp.events'

function main()
	 if not isSampfuncsLoaded() or not isSampLoaded() then return end
	 while not isSampAvailable() do wait(100) end
	 sampAddChatMessage("{21ff00}Tazer{ff704d}Hud{ffffff} | loaded", -1)
	 ton = 0
	 toff = 1
	 while true do
			 wait(0)
			 if not isPauseMenuActive() and isPlayerPlaying(playerHandle) then
				 if ton == 1 then
					 	renderFontDrawText(font, 'Tazer {19ff00}on', 42, 528, 0xffffffff, false)
					end
					if toff == 1 then
						renderFontDrawText(font, 'Tazer {ff704d}off', 42, 528, 0xffffffff, false)
					end
					end
			 end
			 end

function sampev.onChatMessage(msg)
	if msg == "Вам недоступна данная функция" then
		toff = 1
		ton = 0
	end
end

function sampev.onSendCommand(cmd)
if cmd == "/tazer" then
	if ton == 0 and toff == 1 then
			ton = 1
			toff = 0
			else
				ton = 0
				toff = 1
			end
		end
end
