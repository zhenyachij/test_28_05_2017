﻿
&НаКлиенте
Процедура показать(Команда)
	КонтактноеЛицо= Элементы.Список.ТекущаяСтрока;
	Если КонтактноеЛицо= Неопределено Тогда
		Возврат;
	КонецЕсли;
ПараметрФормы = Новый Структура("КонтактноеЛицо",КонтактноеЛицо);
ФормаСпискаОтбор = ПолучитьФорму("Документ.ЗакупкаТоваров.Форма.ФормаОтбор", ПараметрФормы);
ФормаСпискаОтбор.Открыть();
КонецПроцедуры

&НаСервере
Процедура показатьНаСервере()
КонецПроцедуры
