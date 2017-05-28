
&НаКлиенте
Процедура ПоказатьЗначениеПарСеанса(Команда)
	ПоказатьЗначениеПарСеансаНаСервере();
	
КонецПроцедуры

&НаСервере
Процедура ПоказатьЗначениеПарСеансаНаСервере()
	//Объект.Значение=ПараметрыСеанса.ПарСеанс;
КонецПроцедуры

&НаКлиенте
Процедура звук(Команда)
	звукНаСервере();
КонецПроцедуры

&НаСервере
Процедура звукНаСервере()
	файлз = "C:\1.wav";
Скрипт = Новый COMОбъект("MSScriptControl.ScriptControl");
Скрипт.Language="vbscript";
Скрипт.AddCode("
                    |Function Main()
                    |Set oVoice = CreateObject(""SAPI.SpVoice"")
                    |set oSpFileStream = CreateObject(""SAPI.SpFileStream"")
                    |oSpFileStream.Open """+файлз+"""
                    |oVoice.SpeakStream oSpFileStream
                    |End Function");
КонецПроцедуры
