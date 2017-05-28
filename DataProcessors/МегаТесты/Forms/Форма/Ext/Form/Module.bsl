﻿&НаСервере
Процедура заполнение()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Список.Очистить();
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Бригады.Грузчик1 КАК Грузчик1
		|ИЗ
		|	РегистрСведений.Бригады КАК Бригады
		|ГДЕ
		|	Бригады.Период = &МояДата";
	Запрос.УстановитьПараметр("МояДата",Дата);
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		Список.Добавить(,ВыборкаДетальныеЗаписи.Грузчик1,,);
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

КонецПроцедуры


&НаКлиенте
Процедура ПриОткрытии(Отказ)
	заполнение();
	
КонецПроцедуры

&НаКлиенте
Процедура Выбрать(Команда)
	заполнение();
КонецПроцедуры

&НаКлиенте
Процедура показать(Команда)
	показатьНаСервере();
КонецПроцедуры

&НаСервере
Процедура показатьНаСервере()
	этаформа.Парам=ПараметрыСеанса.ПарСеанс;
КонецПроцедуры

&НаКлиенте
Процедура ПроигратьЗвук()
   мФайл = "C:\1.wav";
 
   DynWrapЗарегистрирован = Ложь;
 
   Попытка
      DynWrap = Новый COMОбъект("DynamicWrapperX");
      DynWrapЗарегистрирован = Истина;
      Исключение
         тОбъект = ПолучитьМакетНаСервере();
         тОбъект.Записать(КаталогВременныхФайлов() +"dynwrapx.dll");
 
         КомандаСистемы("regsvr32 dynwrapx.dll", КаталогВременныхФайлов());
         Попытка 
            DynWrap = Новый COMОбъект("DynamicWrapperX");
            DynWrapЗарегистрирован = Истина;
         Исключение
            Сообщить("Ошибка регистрации библиотеки");
         КонецПопытки;
   КонецПопытки;
 
   Если DynWrapЗарегистрирован Тогда
      DynWrap.Register("winmm.dll", "sndPlaySoundA", "i=su");
      DynWrap.sndPlaySoundA(мФайл, 1);
   КонецЕсли;
КонецПроцедуры
 
&НаСервере
Функция ПолучитьМакетНаСервере()
   Возврат Обработки.МегаТесты.ПолучитьМакет("dynwrapx");
КонецФункции

&НаСервере
Процедура ПроигратьЗвукНаСервере()
файлз = "shakira-dare-la-la-la-(best-muzon.me).mp3";
oVoice = Новый COMObject("SAPI.SpVoice");
oSpFileStream = Новый COMObject("SAPI.SpFileStream");
oSpFileStream.Open(файлз);
oVoice.SpeakStream(oSpFileStream);
oSpFileStream.Close();

КонецПроцедуры
	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТАКонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
