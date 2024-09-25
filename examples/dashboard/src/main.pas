{
  file:        main.pas
  description: main project source file
  source:      https://github.com/zendrael/create_pas2js_app
}
program main;
 
{$mode objfpc}{$H+}
 
uses
  SysUtils, 
  Application;
 
var
  WebApplication: TApplication;

begin
  // Starting main code 
  WebApplication:= TApplication.Create;
end.   