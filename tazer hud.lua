
local font_flag = require('moonloader').font_flag
local tazerfont = renderCreateFont('Arial', 13, font_flag.BOLD)

local ev = require 'lib.samp.events'
local inicfg = require 'inicfg'
local dir = 'TazerHud.ini'

local tazer = ' {ff0000}OFF'
local crds = false

function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then return end
	while not isSampAvailable() do wait(100) end
	sampRegisterChatCommand('th_pos', coords)
	cfg = inicfg.load(nil, dir)
	if cfg == nil then
		sampAddChatMessage('{ff0000}>>{ffffff} Не удалосиь загрузить конфиг по пути {ff8c00}moonloader/config/TazerHud.ini{ffffff}.', -1)
		inicfg.save({
			CONFIG = {
				PosX = 0,
				PosY = 0,
				Key = '0x5A',
				Name = 'TAZER'
			}
		}, dir)
	end

	lua_thread.create(trz)
	lua_thread.create(cmd_coords)
	while true do
		wait(0)
	end
end

function coords()
	if crds == false then crds = true showCursor(true, true)
		sampAddChatMessage("{00ff19}>>{ffffff} Для сохранения нажми {ff8c00}ЛКМ{ffffff}, для отмены - {ff8c00}ПКМ{ffffff}.", -1)
		elseif crds == true then crds = false showCursor(false, false)
		end
end

function cmd_coords()
	while true do
		wait(0)
		if crds then
			showCursor(true, true)
			cfg.CONFIG.PosX = x
			cfg.CONFIG.PosY = y
		 x, y = getCursorPos()
		if isKeyJustPressed('0x01') then
		if inicfg.save({
				CONFIG = {
					PosX = x,
					PosY = y,
					Key = cfg.CONFIG.Key,
					Name = cfg.CONFIG.Name
				}
			}, dir) then
				sampAddChatMessage('{00ff19}>>{ffffff} Сохранено. X: '..cfg.CONFIG.PosX..' / Y: '..cfg.CONFIG.PosY.."{ffffff}.", -1)
			end
			cfg = inicfg.load(nil, dir)
			crds = false
			wait(100)
			showCursor(false, false)
		elseif isKeyJustPressed('0x02') then
			crds = false showCursor(false, false)
			cfg = inicfg.load(nil, dir)
		end
		end
	end
end

function trz()
	while true do
			if isKeyJustPressed(cfg.CONFIG.Key) and not sampIsChatInputActive() then
			sampSendChat('/tazer', -1)
		end
		wait(0)
		renderFontDrawText(tazerfont, cfg.CONFIG.Name..tazer, cfg.CONFIG.PosX, cfg.CONFIG.PosY, -1)
	end
end

function ev.onServerMessage(tclr, txt)
	if txt:find('Вы поменяли пули на резиновые') then tazer = ' {42ff00}ON'
	elseif txt:find('Вы поменяли пули на обычные') then tazer = ' {ff0000}OFF'
		end
end
