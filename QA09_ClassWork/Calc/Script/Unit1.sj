function Main()
{
  precondition();
  Test_Addition();
  Test_Substraction();
  Test_Multiplication();
  Test_Division();
  postcondition();
}

// ---- Tests to play with ----

function Test1() //запись сложения по умолчанию -> TestComplete называет кнопки как ему вздумается
{
  var  wndCalculator;
  wndCalculator = Aliases.calc.wndCalculator;
  wndCalculator.btn3.ClickButton();
  wndCalculator.btn.ClickButton();
  wndCalculator.btn5.ClickButton();
  wndCalculator.btn1.ClickButton();
}

function Test2() //демонстрация способов обращения к объектам №1
{
  Aliases.calc.wndCalculator.btn3.ClickButton();
  Aliases.calc.wndCalculator.btn.ClickButton();
  Aliases.calc.wndCalculator.btn5.ClickButton();
  Aliases.calc.wndCalculator.btn1.ClickButton();
}

function Test3() //демонстрация способов обращения к объектам №2
{
  NameMapping.Sys.calc.wndCalculator.btn3.ClickButton();
  NameMapping.Sys.calc.wndCalculator.btn.ClickButton();
  NameMapping.Sys.calc.wndCalculator.btn5.ClickButton();
  NameMapping.Sys.calc.wndCalculator.btn1.ClickButton();
}

function Test4() //демонстрация способов обращения к объектам №3
{
  NameMapping.Sys.calc.wndCalculator.btn3.ClickButton();
  Sys.Process("calc").Window("SciCalc", "Calculator", 1).Window("Button", "+", 20).ClickButton();
  NameMapping.Sys.calc.wndCalculator.btn5.ClickButton();
  NameMapping.Sys.calc.wndCalculator.btn1.ClickButton();
}

function Test5() //перезапись сложения после редактирования алиасов
{
  var  wndCalculator;
  wndCalculator = Aliases.calc.wndCalculator;
  wndCalculator.btn3.ClickButton();
  wndCalculator.btn_plus.ClickButton();
  wndCalculator.btn5.ClickButton();
  wndCalculator.btn_equals.ClickButton();
}

function Test6() //запись вычитания по "умолчанию"
{
  var  wndCalculator;
  wndCalculator = Aliases.calc.wndCalculator;
  wndCalculator.btn7.ClickButton();
  wndCalculator.btn2.ClickButton();
  wndCalculator.btn21.ClickButton();
  wndCalculator.btn_equals.ClickButton();
}

function Test7() //перезапись вычитания после редактирования Mapped Objects
{
  var  wndCalculator;
  wndCalculator = Aliases.calc.wndCalculator;
  wndCalculator.btn7.ClickButton();
  wndCalculator.btn_minus.ClickButton();
  wndCalculator.btn2.ClickButton();
  wndCalculator.btn_equals.ClickButton();
}

function Test8() //запись умножения после маппинга кнопок вручную
{
  var  wndCalculator;
  wndCalculator = Aliases.calc.wndCalculator;
  wndCalculator.btn4.ClickButton();
  wndCalculator.btn_mult.ClickButton();
  wndCalculator.btn6.ClickButton();
  wndCalculator.btn_equals.ClickButton();
}

function Test9() //запись деления после маппинга кнопок вручную
{
  var  wndCalculator;
  wndCalculator = Aliases.calc.wndCalculator;
  wndCalculator.btn9.ClickButton();
  wndCalculator.btn_div.ClickButton();
  wndCalculator.btn3.ClickButton();
  wndCalculator.btn_equals.ClickButton();
}

function Test10() //более привлекательный код за счет присвоения переменной короткого имени
{
  var  calc;
  calc = Aliases.calc.wndCalculator;
  calc.btn9.ClickButton();
  calc.btn_div.ClickButton();
  calc.btn3.ClickButton();
  calc.btn_equals.ClickButton();
}

function Test11() //работа с калькулятором через клавиатуру
{
  var  wndCalculator;
  var  edit;
  wndCalculator = Aliases.calc;
  edit = wndCalculator.Edit;
  edit.Keys("27+32[Enter]");
}

function Test_Addition1() //играемся с переменными и работой с калькулятором через клавиатуру
{
  var num1, num2, result;
  num1 = 27;
  num2 = 32;
  result = 59;
  operation = "+";
  Log.AppendFolder("Addition");
  var  wndCalculator;
  wndCalculator = Aliases.calc;
  //precondition
  wndCalculator.btnC.ClickButton();
  //steps
  wndCalculator.Edit.Keys(num1 + operation + num2 + "[Enter]");
  //verification
  aqObject.CompareProperty(Aliases.calc.Edit.wText, cmpEqual, result + ". ", false);
  Log.PopLogFolder();
}


// ---- Tests to execute ----

function precondition()
{
  TestedApps.calc.Run();
}

function postcondition()
{
  TestedApps.calc.Close();
}

function Test_Addition()
{
  Log.AppendFolder("Addition");
  var  wndCalculator;
  wndCalculator = Aliases.calc;
  //precondition
  wndCalculator.btnC.ClickButton();
  //steps
  wndCalculator.btn3.ClickButton();
  wndCalculator.btn_plus.ClickButton();
  wndCalculator.btn5.ClickButton();
  wndCalculator.btn_equals.ClickButton();
  //verification
  aqObject.CompareProperty(Aliases.calc.Edit.wText, cmpEqual, "8. ", false);
  Log.PopLogFolder();
}

function Test_Substraction()
{
  Log.AppendFolder("Substraction");
  var  wndCalculator;
  wndCalculator = Aliases.calc;
  //precondition
  wndCalculator.btnC.ClickButton();
  //steps
  wndCalculator.btn7.ClickButton();
  wndCalculator.btn_minus.ClickButton();
  wndCalculator.btn2.ClickButton();
  wndCalculator.btn_equals.ClickButton();
  //verification
  aqObject.CompareProperty(Aliases.calc.Edit.wText, cmpEqual, "5. ", false);
  Log.PopLogFolder();
}

function Test_Multiplication()
{
  Log.AppendFolder("Multiplication");
  var  wndCalculator;
  wndCalculator = Aliases.calc;
  //precondition
  wndCalculator.btnC.ClickButton();
  //steps
  wndCalculator.btn4.ClickButton();
  wndCalculator.btn_mult.ClickButton();
  wndCalculator.btn6.ClickButton();
  wndCalculator.btn_equals.ClickButton();
  //verification
  aqObject.CompareProperty(Aliases.calc.Edit.wText, cmpEqual, "24. ", false);
  Log.PopLogFolder();
}

function Test_Division()
{
  Log.AppendFolder("Division");
  var  wndCalculator;
  wndCalculator = Aliases.calc;
  //precondition
  wndCalculator.btnC.ClickButton();
  //steps
  wndCalculator.btn9.ClickButton();
  wndCalculator.btn_div.ClickButton();
  wndCalculator.btn3.ClickButton();
  wndCalculator.btn_equals.ClickButton();
  //verification
  aqObject.CompareProperty(Aliases.calc.Edit.wText, cmpEqual, "2. ", false);
  Log.PopLogFolder();
}

// ---- DDT ----

function Test_MainOperations()
{
  var driver = DDT.CSVDriver(Files.FileNameByName("test_data.txt")); 
  while (!driver.EOF()) 
  {  
    Log.AppendFolder(driver.Value(1));
    var  wndCalculator;
    wndCalculator = Aliases.calc;
    //precondition
    wndCalculator.btnC.ClickButton();
    //steps
    wndCalculator.Edit.Keys(driver.Value(0) + driver.Value(1) + driver.Value(2) + "[Enter]");
    //verification
    aqObject.CompareProperty(Aliases.calc.Edit.wText, cmpEqual, driver.Value(3) + ". ", false);
    Log.PopLogFolder();
    driver.Next();
  }
  DDT.CloseDriver("driver");  
}


