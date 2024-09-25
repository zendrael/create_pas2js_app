unit Greeting;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Web, JS;

type

  TGreeting = class
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

constructor TGreeting.Create;
begin
  myDiv:= document.createElement('div');

  AddElements;
end;

procedure TGreeting.AddElements;
var
  h1, h3: TJSElement;
begin
  h1:= document.createElement('h1');
  h1.innerHTML:= 'Pas 2 JS';
  
  h3:= document.createElement('h3');
  h3.innerHTML:= 'Pascal to JavaScript transpiler';

  myDiv.appendChild(h1);
  myDiv.appendChild(h3);
end;

function TGreeting.Get: TJSElement;
begin
  Result:= myDiv;
end;

destructor TGreeting.Destroy;
begin
    inherited Destroy;
end;

end.
