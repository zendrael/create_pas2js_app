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
    procedure AddElements;
    function Get: TJSElement;
    destructor Destroy;
  end;

implementation

constructor TMenu.Create;
begin
  myDiv:= document.createElement('div');

  AddElements;
end;

procedure TMenu.AddElements;
var
  h1, h3: TJSElement;
begin
  // h1:= document.createElement('h1');
  // h1.innerHTML:= 'Pas 2 JS';
  
  // h3:= document.createElement('h3');
  // h3.innerHTML:= 'Pascal to JavaScript transpiler';

  // myDiv.appendChild(h1);
  // myDiv.appendChild(h3);
end;

function TMenu.Get: TJSElement;
var 
  objHTML : TResourceInfo;

  // RL : TStringDynArray;
  // aInfo : TResourceInfo;
  // el : TJSHTMLElement;
  // S : String;
begin
  SetResourceSource(rsJS);
  // RL:=GetResourceNames;
  // For S in RL do
  //   begin
  //   Writeln('--- Found resource name: ',S,' : ');
  //   if not GetResourceInfo(S,aInfo) then
  //     Writeln('No extra information for resource ',S,' available !')
  //   else
  //     begin
  //     Writeln('Name: ',aInfo.Name);
  //     Writeln('Format: ',aInfo.Format);
  //     Writeln('encoding: ',aInfo.Encoding);
  //     Writeln('unit: ',aInfo.resourceunit);
  //     Writeln('data length: ',Length(aInfo.data));
  //     end;
  //   end;

  if not GetResourceInfo(self.UnitName, objHTML) then
    myDiv.innerhtml:='Resource '+self.UnitName+' not found !'
  else
    myDiv.innerhtml:= window.atob(objHTML.Data);
  Result:= myDiv;
end;

destructor TMenu.Destroy;
begin
    inherited Destroy;
end;

end.
