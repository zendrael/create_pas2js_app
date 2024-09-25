{
  file:        Menu.pas
  description: component project source file
  source:      https://github.com/zendrael/create_pas2js_app
}
unit Menu;

{$mode objfpc}{$H+}

{$R *.html}

interface

uses
  SysUtils, Web, JS, p2jsres,
  Classes, types;

type

  TMenu = class
  private
    { private declarations }
    myDiv: TJSElement;

  public
    { public declarations }
    constructor Create;
    function Get: TJSElement;
  end;

implementation

constructor TMenu.Create;
begin
  myDiv:= document.createElement('div');
end;

function TMenu.Get: TJSElement;
var 
  objHTML : TResourceInfo;
begin
  SetResourceSource(rsJS);

  if not GetResourceInfo(self.UnitName, objHTML) then
    myDiv.innerhtml:='Resource '+self.UnitName+' not found !'
  else
    myDiv.innerhtml:= window.atob(objHTML.Data);
  
  Result:= myDiv;
end;

end.
