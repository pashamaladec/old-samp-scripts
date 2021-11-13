font_flag = require('moonloader').font_flag
font = renderCreateFont('Giger', 20, font_flag.BOLD)
local sampev = require 'lib.samp.events'

function tinfo()
end

function main()
	 if not isSampfuncsLoaded() or not isSampLoaded() then return end
	 while not isSampAvailable() do wait(100) end
	 sampAddChatMessage("{21ff00}Tazer{ff704d}Hud{ffffff} | Загружен, автоматически активируется при начале рабочего дня. Включить/выключить - {8c00ff}/thud", -1)
	 sampRegisterChatCommand("thud", day)
	 ton = 0
	 toff = 1
	 rab = 0
	 while true do
			 wait(0)
			 if not isPauseMenuActive() and isPlayerPlaying(playerHandle) then
				 if rab == 1 then
				 if ton == 1 then
					 	renderFontDrawText(font, 'Tazer {19ff00}on', 42, 1035, 0xffffffff, false)
				end
			end
		end
		if rab == 1 then
					if toff == 1 then
						renderFontDrawText(font, 'Tazer {ff704d}off', 42, 1035, 0xffffffff, false)
					end
				end
					end
				end

function sampev.onServerMessage(tclr, txt)
	if txt:find('Рабочий день начат') then
		rab = 1
		elseif txt:find('Рабочий день окончен') then
		rab = 0
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

function day()
	if rab == 0 then
		rab = 1
		days = "включён"
		else rab = 0
			days = "выключен"
	end
	ton = 0
	toff = 1
sampAddChatMessage('{21ff00}Tazer{ff704d}Hud{ffffff} | Состояние скрипта сменено. Сейчас он {8c00ff}'..days..'', -1)
end
