﻿
&НаКлиенте
Процедура Грузчик1ПриИзменении(Элемент)
	если ПроверкаЗанятости1() тогда
		ЗаписьЗанятости1();   
	иначе
		ОтправкаСообщения();
		Объект.Грузчик1=NULL;
				отказ=истина;
	конецесли;
КонецПроцедуры

&НаКлиенте
Процедура Грузчик1ОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	если Не ПроверкаЗанятости1() тогда
		Обнуление1();   
	конецесли;

КонецПроцедуры




&НаСервере
Функция ЗаписьЗанятости1()
	//зан=Объект.Грузчик.получитьобъект();
		об=Объект.Грузчик1.ПолучитьОбъект();	//зан.Записать();
		об.Занятость=Объект.Дата;
		об.Записать();


КонецФункции

&НаСервере
Функция ПроверкаЗанятости1()
	//зан=Объект.Грузчик.получитьобъект();
	ДатаЗанятость=Формат(Объект.Грузчик1.Занятость, "ДЛФ=Д");
	ДатаДокумента=Формат(Объект.Дата, "ДЛФ=Д");
	флаг=ложь;
	если Объект.Грузчик1.Занятость="" тогда 
		флаг=Истина;
		возврат флаг;
	иначеесли ДатаЗанятость<>ДатаДокумента тогда
		флаг=Истина;
		возврат флаг;
	иначе
		возврат флаг;
	конецесли;

КонецФункции

&НаСервере
Функция обнуление1()
	  	об=Объект.Грузчик1.ПолучитьОбъект();	//зан.Записать();
		об.Занятость=NULL;
		об.Записать();

КонецФункции

&НаСервере
Функция ОтправкаСообщения()
	  	мес=новый СообщениеПользователю;
		мес.Текст="Данный грузчик уже задействован в бригаду.";
		мес.Сообщить();

КонецФункции



