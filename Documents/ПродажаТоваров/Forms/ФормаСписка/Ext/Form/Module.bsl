﻿
&НаКлиенте
Процедура СписокПриАктивизацииЯчейки(Элемент)
	перемен=Элементы.ФормаКоманднаяПанель.ПодчиненныеЭлементы;
КонецПроцедуры

&НаКлиенте
Процедура СписокПриАктивизацииСтроки(Элемент)
	если Элемент.ТекущиеДанные.СуммаДокумента>10000 тогда
		Элементы.ФормаКоманднаяПанель.ПодчиненныеЭлементы.ФормаСоздатьНаОсновании.Доступность=Истина;
	иначе
		Элементы.ФормаКоманднаяПанель.ПодчиненныеЭлементы.ФормаСоздатьНаОсновании.Доступность=Ложь;
	КонецЕсли;
КонецПроцедуры
