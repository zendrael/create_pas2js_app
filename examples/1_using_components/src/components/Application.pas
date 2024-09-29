{
  file:        Application.pas
  description: component project source file
  source:      https://github.com/zendrael/create_pas2js_app
}
unit Application;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Web, JS,
  //add your components
  Form, Menu;

type

  TApplication = class
  private
    { private declarations }
    
  public
    { public declarations }
    constructor Create;
    procedure Run;
    destructor Destroy;
  end;

implementation

constructor TApplication.Create;
begin
  Run;
end;

procedure TApplication.Run;
var
  form: TForm;
  menu: TMenu;
begin
  //write your own code here!
  //this will be shown in the browser's console
  WriteLn('Hello from Pas2JS!');

  //instantiate components
  form:= TForm.Create;
  menu:= TMenu.Create;

  //add to the screen
  document.body.appendChild( menu.Get );
  document.body.appendChild( form.Get );
end;

destructor TApplication.Destroy;
begin
    inherited Destroy;
end;

end.
