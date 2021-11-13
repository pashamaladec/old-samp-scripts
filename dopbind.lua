--{ЦВЕТА}
-- D9034C - малиновый
-- 4286f4 - голубой
-- ff8800 - оранженвый
--{ЦВЕТА}

function oop(param)
	if param == '' then
		sampAddChatMessage('{D9034C}Неправильные значения. {ffffff}Правильно /oop {4286f4}ID {ff8800}REASON', -1)
		sampAddChatMessage('{ff8800}ПРИЧИНЫ {D9034C}(вводить только одну цифру){ffffff}:', -1)
		sampAddChatMessage('{D9034C}1 - {4286f4}нападение на сотрудника государственных структур.', -1)
		sampAddChatMessage('{D9034C}2 - {4286f4}нападение на государственные учреждения.', -1)
		sampAddChatMessage('{D9034C}3 - {4286f4}терракт. Организация, участие или испольнение.', -1)
		sampAddChatMessage('{D9034C}4 - {4286f4}терроризм.', -1)
		sampAddChatMessage('{D9034C}5 - {4286f4}похищение сотрудника государственных организаций.', -1)
		sampAddChatMessage('{D9034C}6 - {4286f4}убийство 2 или более человек.', -1)
		sampAddChatMessage('{D9034C}7 - {4286f4}торговля людьми.', -1)
		sampAddChatMessage('{D9034C}8 - {4286f4}срыв спец. операции.', -1)
	else
	id, reason = string.match(param, '(%d+) (%d+)')
	pnick = sampGetPlayerNickname(id):gsub('_', ' ')
		if reason == nil then
			sampAddChatMessage('{D9034C}Неправильные значения. {ffffff}Правильно /oop {4286f4}ID {ff8800}REASON', -1)
			sampAddChatMessage('{ff8800}ПРИЧИНЫ {D9034C}(вводить только одну цифру){ffffff}:', -1)
			sampAddChatMessage('{D9034C}1 - {4286f4}нападение на сотрудника государственных структур.', -1)
			sampAddChatMessage('{D9034C}2 - {4286f4}нападение на государственные учреждения.', -1)
			sampAddChatMessage('{D9034C}3 - {4286f4}терракт. Организация, участие или испольнение.', -1)
			sampAddChatMessage('{D9034C}4 - {4286f4}терроризм.', -1)
			sampAddChatMessage('{D9034C}5 - {4286f4}похищение сотрудника государственных организаций.', -1)
			sampAddChatMessage('{D9034C}6 - {4286f4}убийство 2 или более человек.', -1)
			sampAddChatMessage('{D9034C}7 - {4286f4}торговля людьми.', -1)
			sampAddChatMessage('{D9034C}8 - {4286f4}срыв спец. операции.', -1)
	else
		string = '/dep Mayor, дело '..pnick..' не рассматривать, ООП 1.'..reason..'.'
		sampSendChat(string)
end
		end
	end

function main()
	 if not isSampfuncsLoaded() or not isSampLoaded() then return end
	 while not isSampAvailable() do wait(100) end
	 sampAddChatMessage('{4286f4}Загружен. {ffffff}Доступные команды: {D9034C}/oop', -1)		-- тут тоже поменяй для удобства
	 sampRegisterChatCommand('oop', oop)	-- изменить команду
	 while true do
	 	wait (0)
	 end
end
авыфтавыфатвыфаыв