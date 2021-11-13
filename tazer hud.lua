font_flag = require('moonloader').font_flag
--ШРИФТЫ ('название', размер)
tazer = renderCreateFont('Arial', 17)
timer = renderCreateFont('Arial', 12, font_flag.BOLD)
--ШРИФТЫ
local sampev = require 'lib.samp.events'

	 -- НАСТРОЙКИ СКРИПТА
	 tkey = VK_Z																				-- Клавиша для смены режима тазера def. VK_Z
	 thud = '{21ff00}Tazer{ff704d}Hud{ffffff} | ' 			-- префикс перед сообщением скрипта def. '{21ff00}Tazer{ff704d}Hud{ffffff} | '
	 tgg = '{08ff00}*{ffffff}' 								-- зелёная звёздочка 08ff00
	 tg = '{00a5ff}*{ffffff}' 								-- обычная звёздочка 00a5ff
	 soff = '{ff0202}OFF' 									-- состояние худа ВЫКЛ def.	'{ff0202}OFF'
	 son = '{19ff00}ON' 									-- состояние худа ВКЛ def. '{19ff00}ON'
	 st = 'Tazer'											-- надпись перед ВКЛ/ВЫКЛ
	 timeron = 0											-- вкл/выкл таймера def. 1
	 cx = 42												-- координата X осн. худа def. 42
	 cy = 538 												-- координата Y осн. худа def. 528
	 tcx = 58 												-- координата X таймера def. 58
	 tcy = 512 												-- координата Y таймера def. 512
	 -- !НЕ ТРОГАТЬ! --
	 taz = '1'
	 state = soff 											-- изначальное состояние худа
	 opt = 0
	 ton = 0 												-- переменная для включения осн. худа def. 0
	 toff = 1 												-- переменная для выключения осн. худа def. 1
	 rab = 0 												-- переменная отображения рабочего дня def. 0
	 -- НАСТРОЙКИ СКРИПТА

function main()
	 if not isSampfuncsLoaded() or not isSampLoaded() then return end
	 while not isSampAvailable() do wait(100) end
	 sampAddChatMessage("{21ff00}Tazer{ff704d}Hud{ffffff} | Загружен, автоматически активируется при начале рабочего дня. Помощь - {8c00ff}/thelp", -1)
	 sampRegisterChatCommand("thud", day)
	 sampRegisterChatCommand("thelp", guide)
	 sampRegisterChatCommand("tcoord", opt)
	 sampRegisterChatCommand("ttimer", timeron)

	 while true do
			 wait(0)
			 if isKeyJustPressed(tkey) and not sampIsChatInputActive() then sampSendChat('/tazer')
			 end
			 time=(os.date("%H",os.time())..':'..os.date("%M",os.time())..':'..os.date('%S',os.time()))
			 if not isPauseMenuActive() and isPlayerPlaying(playerHandle) then
			 	if timeron == 1 then
				 renderFontDrawText(timer, time, tcx, tcy, 0xFF8c00ff, false)
				else
				 if rab == 1 then
					 	renderFontDrawText(tazer, ''..st..' '..state..'', cx, cy, 0xffffffff, false)
					end
				end
			end
				 	if opt == 1 then
				 	cux, cuy = getCursorPos()
				 	cux = cux+15
				 	cuy = cuy+5
					renderFontDrawText(tazer, ''..st..' '..state..'', cux, cuy, 0xffffffff, false)
					renderFontDrawText(timer, '{ff4300}X: '..cux..' {4286f4}Y: '..cuy, cux, cuy+20, 0xffffffff, false)
					if isKeyJustPressed(VK_LBUTTON) then
						sampAddChatMessage(thud..'{ff4300}X: '..cux..' {4286f4}Y: '..cuy..'', -1)
					end
				end
			end
		end

function opt()
	if opt == 0 then
		opt = 1
		showCursor(true, true)
		else
			showCursor(false,false)
			opt = 0
		end
end

function guide()
	sampShowDialog(0, '{ffd505}TazerHud', '{ffffff}/thud{a0a0a0} - вкл/выкл основного худа\n{ffffff}/thelp{a0a0a0} - гайд по скрипту, этот диалог\n{ffffff}/tcoord {a0a0a0} - какая никакая настройка. Выводит на экран координаты \n'..tg..'Для того что бы настроить положение худа, таймера или прочего..\n   нужно открыть скрипт блокнотом и изменить подписанные параметны\n'..tg..'Время для таймера - время на компьютере \n \n'..tgg..'Если состояние тазера {8c00ff}[ON/OFF]{ffffff} сбилось..\n  нужно выключить скрипт {8c00ff}[/thud]{ffffff}, переключить тазер {8c00ff}[/tazer]{ffffff} и снова включить\n', 'CLOSE', '', 4)
end

function sampev.onServerMessage(tclr, txt)
	if txt:find('Рабочий день начат') then
		rab = 1
		elseif txt:find('Рабочий день окончен') then
		rab = 0
	end
	if txt:find('Вы поменяли пули на резиновые') then ton = 1 toff = 0 state = son
	elseif
		txt:find('Вы поменяли пули на обычные') then ton = 0 toff = 1 state = soff
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
sampAddChatMessage(thud..'Состояние скрипта сменено. Сейчас он {8c00ff}'..days, -1)
end
