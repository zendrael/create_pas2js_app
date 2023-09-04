unit Background;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Web, JS;

type

  TBackground = class
  private
    { private declarations }
    circles: TJSElement;
    
  public
    { public declarations }
    constructor Create;
    procedure AddElements;
    function Get: TJSElement;
    destructor Destroy;
  end;

implementation

constructor TBackground.Create;
begin
  circles:= document.createElement('ul');
  circles['class']:= 'circles';

  AddElements;
end;

procedure TBackground.AddElements;
var
  i: integer;
begin

  for i:=0 to 10 do
  begin
    circles.appendChild( TJSElement( document.createElement('li') ) );
  end;

end;

function TBackground.Get: TJSElement;
begin
  Result:= circles;
end;

destructor TBackground.Destroy;
begin
    inherited Destroy;
end;

end.
