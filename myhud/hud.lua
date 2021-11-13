-- red = ff0000
-- green = 59ff00
-- apelsin = d1921f


local ff = require('moonloader').font_flag
local vkeys = require('vkeys')
local inicfg = require('inicfg')
local weapons = require ('hud.weapons')
local memory = require('memory')

local dir = 'moonloader\\hud\\hudsettings.ini'

local font = renderCreateFont('Arial', 13, ff.BOLD)

local health = renderLoadTextureFromFile('moonloader\\hud\\icon\\hp.png')
local armour = renderLoadTextureFromFile('moonloader\\hud\\icon\\armour.png')
local money = renderLoadTextureFromFile('moonloader\\hud\\icon\\money.png')
local fist = renderLoadTextureFromFile('moonloader\\hud\\icon\\fist.png')
local pngammo = renderLoadTextureFromFile('moonloader\\hud\\icon\\ammo.png')
local pngcar = renderLoadTextureFromFile('moonloader\\hud\\icon\\car.png')
local pnglodka = renderLoadTextureFromFile('moonloader\\hud\\icon\\lodka.png')
local pngplane = renderLoadTextureFromFile('moonloader\\hud\\icon\\plane.png')
local pngmoto = renderLoadTextureFromFile('moonloader\\hud\\icon\\moto.png')
local pngheli = renderLoadTextureFromFile('moonloader\\hud\\icon\\heli.png')
local lowhp = renderLoadTextureFromFile('moonloader\\hud\\icon\\lowhp.png')


function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then return end
	while not isSampAvailable() do wait(100) end
	displayHud(false)
	sampRegisterChatCommand('hud_pos', hud)
while true do
	local ini = inicfg.load(nil, dir)
	wait(0)

	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- CURSOR
	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	if state == true then showCursor(true, true)
		cx, cy = getCursorPos()
		ini.coordinations.y = cy
		ini.coordinations.x = cx
		if isKeyJustPressed(VK_RBUTTON) then
			wait(100)
			local newdata = {
				coordinations = {
					y = cy,
					x = cx
				},
				hp = {
					hpcolor = ini.hp.hpcolor,
					maxhp = ini.hp.maxhp,
					maxhpcolor=ini.hp.maxhpcolor
				},
				armour = {
					armourcolor=ini.armour.armourcolor,
					maxarmourcolor=ini.armour.maxarmourcolor,
					maxarmour=ini.armour.maxarmour
				},
				money = {
					dollarcolor= ini.money.dollarcolor,
					moneycolor= ini.money.moneycolor
				},
				ammo = {
					ammocolor=ini.ammo.ammocolor,
					ammobetweencolor=ini.ammo.ammobetweencolor,
					ammobetween=ini.ammo.ammobetween,
					wcolor=ini.ammo.wcolor
				},
				car = {
					carcolor = ini.car.carcolor
				}
			}
			if inicfg.save(newdata, dir) then sampAddChatMessage("{59ff00}»{ffffff} Новые координаты худа были сохранены (X: "..cx.." / Y: "..cy..').', -1) else sampAddChatMessage('{ff0000}»{ffffff} Не удалось сохранить настройки.', -1) end
			showCursor(false, false)
			state = false
		elseif wasKeyPressed(VK_LBUTTON) then state = false wait(100) showCursor(false, false) end
	end
	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- GET
	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	mon = getPlayerMoney(PLAYER_HANDLE)
	m = '{'..ini.money.moneycolor..'}'..mon..'{'..ini.money.dollarcolor..'}${ffffff}'

	hp = getCharHealth(PLAYER_PED)
	if hp > 100 then hp = "{"..ini.hp.hpcolor.."}"..ini.hp.maxhp.."{"..ini.hp.maxhpcolor.."}+{ffffff}" end

	ar = getCharArmour(PLAYER_PED)
	if ar > 100 then ar = "{"..ini.armour.armourcolor.."}"..ini.armour.maxarmour.."{"..ini.armour.maxarmourcolor.."}+{ffffff}" end

	weap = getCurrentCharWeapon(PLAYER_PED)

	wname = weapons.get_name(weap)
	if weap < 2 then wname = '' end
	ammo = getAmmoInCharWeapon(PLAYER_PED, weap)
	cammo = getAmmoInClip()
	ammo = ammo - cammo
	ammo = '{'..ini.ammo.ammobetweencolor..'}'..ini.ammo.ammobetween..ammo
	if weap < 16 or weap == 40 or weap == 46 or weap == 44 or weap == 45 then ammo = '' cammo = '' end

	if isCharInAnyCar(PLAYER_PED) then
		if storeCarCharIsInNoSave(PLAYER_PED) then
			carhp = getCarHealth(storeCarCharIsInNoSave(PLAYER_PED)) end end
	if carhp == nil or not isCharInAnyCar(PLAYER_PED) then carhp = '' end

	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	-- RENDER
	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	if not sampIsScoreboardOpen() or not sampIsLocalPlayerSpawned() then
	renderFontDrawText(font, "      "..hp.."\n      "..ar.."\n      "..m.."\n      "..wname, ini.coordinations.x, ini.coordinations.y, 0xFFFFFFFF)
	renderFontDrawText(font, "{"..ini.ammo.ammocolor.."}      "..cammo..ammo, ini.coordinations.x, ini.coordinations.y + 77, 0xFFFFFFFF)
	renderFontDrawText(font, '      '..carhp, ini.coordinations.x, ini.coordinations.y - 18, 0xFFFFFFFF)
	renderDrawTexture(health, ini.coordinations.x, ini.coordinations.y - 4, 26, 26, 0, -1)
	renderDrawTexture(armour, ini.coordinations.x, ini.coordinations.y + 15, 26, 26, 0, -1)
	renderDrawTexture(money, ini.coordinations.x + 2, ini.coordinations.y + 35, 26, 26, 0, -1)
  renderDrawTexture(fist, ini.coordinations.x, ini.coordinations.y + 53, 27, 27, 0, -1)
	if ammo ~= "" then
	renderDrawTexture(pngammo, ini.coordinations.x + 2, ini.coordinations.y + 72, 27, 27, 0, -1) end
	end

if isCharInAnyCar(PLAYER_PED) then
	if isCharInAnyBoat(PLAYER_PED) then
		renderDrawTexture(pnglodka, ini.coordinations.x + 1, ini.coordinations.y - 23, 26, 26, 0, 0xFFFFFFFF)
	elseif
	isCharInAnyHeli(PLAYER_PED) then
		renderDrawTexture(pngheli, ini.coordinations.x - 5, ini.coordinations.y - 27, 29, 29, 0, 0xFFFFFFFF)
		elseif
		isCharInAnyPlane(PLAYER_PED) then
			renderDrawTexture(pngplane, ini.coordinations.x - 3, ini.coordinations.y - 28, 33, 33, 0, 0xFFFFFFFF)
		else
			renderDrawTexture(pngcar, ini.coordinations.x - 2, ini.coordinations.y - 24, 29, 29, 0, 0xFFFFFFFF) end end
		end
end


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- OTHER FUNCTIONS
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


function hud()
	state = not state
	if state == true then sampAddChatMessage('{d1921f}»{ffffff} Нажми {d1921f}правую кнопку мыши{ffffff} для сохранения или {d1921f}левую кнопку мыши{ffffff} для отмены.', -1) end
end

function getAmmoInClip()
  local struct = getCharPointer(playerPed)
  local prisv = struct + 0x0718
  local prisv = memory.getint8(prisv, false)
  local prisv = prisv * 0x1C
  local prisv2 = struct + 0x5A0
  local prisv2 = prisv2 + prisv
  local prisv2 = prisv2 + 0x8
  local cammo = memory.getint32(prisv2, false)
  return cammo
end
