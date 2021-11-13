--{ЦВЕТА}
-- {ffffff} - белый
-- {D9034C} - малиновый
-- {4286f4} - голубой
-- {ff8800} - оранженвый
-- {2975d1} - тёмно голубой
-- {777777} - серый
-- {00ff11} - зелёный
-- {ff0000} - красный
--{ЦВЕТА}

	local sampev = require 'lib.samp.events'

	local sureason =
	[[
	{2975d1}(ст.1){ff8800} Нарушение порядка
	{2975d1}(ст.2){ffffff} Хранение ключей от камеры
	{2975d1}(ст.3){ff8800} Драка
	{2975d1}(ст.4){ffffff} Ношение оружия в открытом виде
	{2975d1}(ст.5){ffffff} Клевета
	{2975d1}(ст.6){ffffff} Продажа оружия
	{2975d1}(ст.7){777777} Подделка
	{2975d1}(ст.8){ff8800} Неуплата штрафа
	{2975d1}(ст.9){ffffff} Манифестация
	{2975d1}(ст.10){ffffff} Повреждение чужого имущества
	{2975d1}(ст.11){ffffff} Угон транспортного средства
	{2975d1}(ст.12){ffffff} Наезд на пешехода
	{2975d1}(ст.13){777777} Выращивание наркотических веществ
	{2975d1}(ст.14){ff8800} Проникновение на охраняемые объекты
	{2975d1}(ст.15){ff8800} Помеха
	{2975d1}(ст.16){ffffff} Взятка
	{2975d1}(ст.17){ffffff} Ношение оружия без лицензии
	{2975d1}(ст.18){ff8800} Оскорбление
	{2975d1}(ст.19){ff8800} Неподчинение сотруднику ПД/ФБР
	{2975d1}(ст.20){ffffff} Продажа государственного имущества
	{2975d1}(ст.21){ffffff} Продажа наркотиков
	{2975d1}(ст.22){ffffff} Хранение запрещённых веществ
	{2975d1}(ст.23){ffffff} Употребление наркотических веществ
	{2975d1}(ст.24){ffffff} Бандитизм
	{2975d1}(ст.25){ff8800} Уход
	{2975d1}(ст.26){ffffff} Кража
	{2975d1}(ст.27){ff8800} Разбой
	{2975d1}(ст.28){777777} Похищение
	{2975d1}(ст.29){ffffff} Побег
	{2975d1}(ст.30){ff8800} Нападение на военнослужащего
	{2975d1}(ст.31){ff8800} Нападение на полицейского
	{2975d1}(ст.32){ff8800} Нападение на агента ФБР или мэра
	{2975d1}(ст.33){ffffff} Терроризм
	{2975d1}(ст.34){ffffff} Соучастие
	{2975d1}(ст.35){ffffff} Срыв спец.операции
	{2975d1}(ст.36){777777} Агитация
	{2975d1}(ст.37){777777} Организация занятия проституцией или занятие проституцией]]

	function oop(id)
		if id == '' then
			sampAddChatMessage('{ff0000}| {ffffff}Неправильные значения, введи {4286f4}/oop id', -1)
		else
		local idd = string.match(id, '(%d+)')
		pnick = sampGetPlayerNickname(id):gsub('_', ' ')
		sampShowDialog(101, '{ff0000}ООП{ffffff}: {ff8800}'..pnick..' ({4286f4}'..idd..'{ff8800})', '{2975d1}(ст. 1.1){ffffff} Нападение на сотрудников гос. структур\n{2975d1}(ст. 1.2){ffffff} Нападение на гос. учреждения\n{2975d1}(ст. 1.3){ffffff} Терракт	(организация, участие)\n{2975d1}(ст. 1.4){ffffff} Терроризм\n{2975d1}(ст. 1.5){ffffff} Похищение сотрудников гос. структур\n{2975d1}(ст. 1.6){ffffff} Убийство 2+ человек\n{2975d1}(ст. 1.7){ffffff} Торговля людьми\n{2975d1}(ст. 1.8){ffffff} Срыв спец. операции', 'OK', 'CANCEL', 4)
			end
	end

	function su(id)
		if id == '' then
			sampAddChatMessage('{ff0000}|{ffffff} Неправильные значения, введи {4286f4}/su id', -1)
		elseif sampIsPlayerConnected(id) then
		local	idd = string.match(id, '(%d+)')
				if idd == nil then sampAddChatMessage('{ff0000}|{ffffff} Неправильные значения, введи {4286f4}/su id', -1) else
			local sunick = sampGetPlayerNickname(id):gsub('_', ' ')
			suid = idd
			sampShowDialog(100, '\\\\\\\\\\\\\\\\{0008ff}SU{ff0000}SPECT{ffffff}: {ff8800}'..sunick..'{ff8800} ({4286f4}'..suid..'{ff8800})', sureason, 'OK', 'CANCEL', 4)
		end
				end
	end

	function mcl(cn)
		if cn == '' then sampSendChat('/clist')
		else
		sampSendChat('/clist '..cn)
		end
	end

function main()
	 if not isSampfuncsLoaded() or not isSampLoaded() then return end
	 while not isSampAvailable() do wait(100) end
	 sampAddChatMessage('{00ff11}| {4286f4}Загружен. {ffffff}Доступные команды: {D9034C}/oop{ffffff},{D9034C} /cl{ffffff},{D9034C} /ssu', -1)
	 sampRegisterChatCommand('oop', oop)
	 sampRegisterChatCommand('cl', mcl)
	 sampRegisterChatCommand('ssu', su)
	 while true do
	 	wait (0)
	 op, b, l, i = sampHasDialogRespond(100)
	 if op then
		 if b == 1 and l == 0 then sampSendChat('/su '..suid..' 1 Нарушение порядка')
		 end
			if b == 1 and l == 1 then sampSendChat('/su '..suid..' 2 Хранение ключей от камеры')
			end
			if b == 1 and l == 2 then sampSendChat('/su '..suid..' 2 Драка')
			end
			if b == 1 and l == 3 then sampSendChat('/su '..suid..' 2 Ношение оружия в открытом виде')
			end
			if b == 1 and l == 4 then sampSendChat('/su '..suid..' 2 Клевета')
			end
			if b == 1 and l == 5 then sampSendChat('/su '..suid..' 2 Продажа оружия')
			end
			if b == 1 and l == 6 then sampSendChat('/su '..suid..' 2 Подделка')
			end
			if b == 1 and l == 7 then sampSendChat('/su '..suid..' 2 Неуплата штрафа')
			end
			if b == 1 and l == 8 then sampSendChat('/su '..suid..' 2 Манифестация')
			end
			if b == 1 and l == 9 then sampSendChat('/su '..suid..' 2 Порча имущества')
			end
			if b == 1 and l == 10 then sampSendChat('/su '..suid..' 2 Угон')
			end
			if b == 1 and l == 11 then sampSendChat('/su '..suid..' 2 Наезд')
			end
			if b == 1 and l == 12 then sampSendChat('/su '..suid..' 3 Выращивание наркотических веществ')
			end
			if b == 1 and l == 13 then sampSendChat('/su '..suid..' 3 Проникновение')
			end
			if b == 1 and l == 14 then sampSendChat('/su '..suid..' 2 Помеха')
			end
			if b == 1 and l == 15 then sampSendChat('/su '..suid..' 2 Взятка')
			end
			if b == 1 and l == 16 then sampSendChat('/su '..suid..' 2 Ношение оружия без лицензии')
			end
			if b == 1 and l == 17 then sampSendChat('/su '..suid..' 2 Оскорбление')
			end
			if b == 1 and l == 18 then sampSendChat('/su '..suid..' 2 Неподчинение')
			end
			if b == 1 and l == 19 then sampSendChat('/su '..suid..' 3 Продажа гос. имущества')
			end
			if b == 1 and l == 20 then sampSendChat('/su '..suid..' 3 Продажа наркотиков')
			end
			if b == 1 and l == 21 then sampSendChat('/su '..suid..' 3 Хранение запрещённых веществ')
			end
			if b == 1 and l == 22 then sampSendChat('/su '..suid..' 3 Употребление наркотических веществ')
			end
			if b == 1 and l == 23 then sampSendChat('/su '..suid..' 3 Бандитизм')
			end
			if b == 1 and l == 24 then sampSendChat('/su '..suid..' 3 Уход')
			end
			if b == 1 and l == 25 then sampSendChat('/su '..suid..' 3 Кража')
			end
			if b == 1 and l == 26 then sampSendChat('/su '..suid..' 3 Разбой')
			end
			if b == 1 and l == 27 then sampSendChat('/su '..suid..' 4 Похищение')
			end
			if b == 1 and l == 28 then sampSendChat('/su '..suid..' 4 Побег')
			end
			if b == 1 and l == 29 then sampSendChat('/su '..suid..' 4 Нападение на военнослужащего')
			end
			if b == 1 and l == 30 then sampSendChat('/su '..suid..' 5 Нападение на полицейского')
			end
			if b == 1 and l == 31 then sampSendChat('/su '..suid..' 6 Нападение на агента ФБР/мэра')
			end
			if b == 1 and l == 32 then sampSendChat('/su '..suid..' 6 Терроризм')
			end
			if b == 1 and l == 33 then sampSendChat('/su '..suid..' 3 Соучастие')
			end
			if b == 1 and l == 34 then sampSendChat('/su '..suid..' 4 Срыв спец. операции')
			end
			if b == 1 and l == 35 then sampSendChat('/su '..suid..' 3 Агитация')
			end
			if b == 1 and l == 36 then sampSendChat('/su '..suid..' 3 Занятие проституцией')
			end
		else
			op1, b1, l1, i1 = sampHasDialogRespond(101)
			if op1 then
				if b1 == 1 and l1 == 0 then sampSendChat('/dep Mayor, дело '..pnick..' не рассматривать, ООП 1.1.')
				end
				if b1 == 1 and l1 == 1 then sampSendChat('/dep Mayor, дело '..pnick..' не рассматривать, ООП 1.2.')
				end
				if b1 == 1 and l1 == 2 then sampSendChat('/dep Mayor, дело '..pnick..' не рассматривать, ООП 1.3.')
				end
				if b1 == 1 and l1 == 3 then sampSendChat('/dep Mayor, дело '..pnick..' не рассматривать, ООП 1.4.')
				end
				if b1 == 1 and l1 == 4 then sampSendChat('/dep Mayor, дело '..pnick..' не рассматривать, ООП 1.5.')
				end
				if b1 == 1 and l1 == 5 then sampSendChat('/dep Mayor, дело '..pnick..' не рассматривать, ООП 1.6.')
				end
				if b1 == 1 and l1 == 6 then sampSendChat('/dep Mayor, дело '..pnick..' не рассматривать, ООП 1.7.')
				end
				if b1 == 1 and l1 == 7 then sampSendChat('/dep Mayor, дело '..pnick..' не рассматривать, ООП 1.8.')
				end
			else
			end
	 end
	 end
end
