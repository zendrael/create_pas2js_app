{
  file:        main.pas
  description: main project source file
  source:      https://github.com/zendrael/create_pas2js_app
}
program main;
 
{$mode objfpc}{$H+}
 
uses
  JS, Classes, SysUtils, Web;
 
begin
  // Starting main code 
  document.body.innerHTML +='<h1>Hello from Pas2JS!</h1>';
end.   