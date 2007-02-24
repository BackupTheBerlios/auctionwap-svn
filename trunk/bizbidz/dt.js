
var tags_after_clock  = " </b></font>"
var tags_middle_clock = ","
var tags_before_clock = " <font face='verdana, arial'  size=1pt; color='black' >"

if(navigator.appName == "Netscape") {
document.write('<layer id="clock"></layer><br>');
}

if (navigator.appVersion.indexOf("MSIE") != -1){
document.write('<span id="clock"></span><br>');
//document.write('&nbsp', navigator.appName, '&nbsp', navigator.appVersion.indexOf("MSIE"))
}


DaysofWeek = new Array()
  DaysofWeek[0]="[Sunday]"
  DaysofWeek[1]="[Monday]"
  DaysofWeek[2]="[Tuesday]"
  DaysofWeek[3]="[Wednesday]"
  DaysofWeek[4]="[Thursday]"
  DaysofWeek[5]="[Friday]"
  DaysofWeek[6]="[Saturday]"

Months = new Array()
  Months[0]="January"
  Months[1]="February"
  Months[2]="March"
  Months[3]="April"
  Months[4]="May"
  Months[5]="June"
  Months[6]="July"
  Months[7]="August"
  Months[8]="September"
  Months[9]="October"
  Months[10]="November"
  Months[11]="December"

function upclock(){
var dte = new Date();
var hrs = dte.getHours();
var min = dte.getMinutes();
var sec = dte.getSeconds();
var day = DaysofWeek[dte.getDay()]
var date = dte.getDate()
var month = Months[dte.getMonth()]
var year = dte.getFullYear()

var col = ":";
var spc = " ";
var com = " [ ";
var com1=" ]";
var apm;

if (date == 1 || date == 21 || date == 31)
  {ender = "st"}
else
if (date == 2 || date == 22)
  {ender = "nd"}
else
if (date == 3 || date == 23)
  {ender = "rd"}

else
  {ender = "th"}

if (11 < hrs) {
apm="pm";
hrs-=12;
}

else {
apm="am";
}

if (hrs == 0) hrs=12;
if (hrs<=9) hrs="0"+hrs;
if (min<=9) min="0"+min;
if (sec<=9) sec="0"+sec;


if(navigator.appName == "Netscape") {
clock.innerHTML = tags_before_clock+hrs+col+min+col+sec+apm+spc+tags_middle_clock+spc+day.substring(0,3)+com+date+ender+spc+month.substring(0,3)+year+tags_after_clock;
document.clock.document.close();
}

if (navigator.appVersion.indexOf("MSIE") != -1){
//document.f1.text1.value
clock.innerHTML= com+hrs+col+min+col+sec+apm+com1+spc+day+com+spc+date+ender+spc+month.substring(0,3)+spc+year+com1;

}
}

setInterval("upclock()",1000);

