﻿&НаСервере
Функция Сверка()
	Объект.НомерАвтомобиля=Объект.Автомобиль.НомерАвтомобиля;
	флаг=ложь;
Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Бригады.НомерАвтомобиля КАК НомерАвтомобиля,
		|	Бригады.Водитель КАК Водитель,
		|	Бригады.Грузчик1 КАК Грузчик1,
		|	Бригады.Грузчик2 КАК Грузчик2
		|ИЗ
		|	РегистрСведений.Бригады КАК Бригады";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		если  Выборка.НомерАвтомобиля=Объект.Автомобиль.НомерАвтомобиля Тогда
			флаг=истина;
		КонецЕсли;
	КонецЦикла; 	
	если флаг=Истина тогда
		
			
	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	СостояниеБригадОстатки.КилометражОстаток КАК КилометражОстаток
		|ИЗ
		|	РегистрНакопления.СостояниеБригад.Остатки(, НомерАвтомобиля = &НомерАвтомобиля) КАК СостояниеБригадОстатки";
	
	Запрос.УстановитьПараметр("НомерАвтомобиля",Объект.НомерАвтомобиля);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка= РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		Объект.Километраж=Выборка.КилометражОстаток;
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
возврат истина;
	иначе возврат ложь;
	конецЕсли;
КонецФункции

&НаКлиенте
Процедура АвтомобильПриИзменении(Элемент)

	если Сверка()=ложь тогда
		Объект.Автомобиль=NULL;
		Объект.Километраж=NULL;
	КонецЕсли;

	

КонецПроцедуры

&НаКлиенте
Процедура НомерАвтоПриИзменении(Элемент)
	ном=Элемент;

КонецПроцедуры

&НаСервере
Функция Коректор()
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	СостояниеБригадОстатки.КилометражОстаток КАК КилометражОстаток
		|ИЗ
		|	РегистрНакопления.СостояниеБригад.Остатки(, НомерАвтомобиля = &НомерАвтомобиля) КАК СостояниеБригадОстатки";
	
	Запрос.УстановитьПараметр("НомерАвтомобиля",Объект.НомерАвтомобиля);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка= РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		теккил=Выборка.КилометражОстаток;
	КонецЦикла;

	Объект.Километраж=теккил+Объект.ТекущееСостояниеЗаказа.Километраж;
КонецФункции

&НаКлиенте
Процедура ТекущееСостояниеЗаказаПриИзменении(Элемент)
	Коректор();
КонецПроцедуры

&НаСервере
Функция ПолучениеАдреса()
		стр=объект.Покупатель.Адресс;
		возврат стр;
	КонецФункции
	
	&НаСервере
Функция ПолучениеКонтактногоЛица()
		стр=объект.Покупатель.КонтактноеЛицо;
		возврат стр;
КонецФункции

&НаКлиенте
Процедура ПокупательПриИзменении(Элемент)
	Объект.КонтактноеЛицо = ПолучениеКонтактногоЛица();
	Объект.Адресс= ПолучениеАдреса();

КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Объект.КонтактноеЛицо = ПолучениеКонтактногоЛица();
	Объект.Адресс= ПолучениеАдреса();

КонецПроцедуры
