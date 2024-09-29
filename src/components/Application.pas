{
  file:        Application.pas
  description: component project source file
  source:      https://github.com/zendrael/create_pas2js_app
}
unit Application;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, classes, Web, JS, webrouter,
  //add your components
  Form, Menu;

type

  TApplication = class
  private
    { private declarations }
    procedure RegisterRoutes;
    procedure HandleRoutes(URl : String; aRoute : TRoute; Params: TStrings);
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

procedure TApplication.RegisterRoutes;
begin
  Router.InitHistory(hkHash);
  //if default route, you can pass true as 3rd param
  Router.RegisterRoute('form/:ID', @HandleRoutes, true);
end;

procedure TApplication.HandleRoutes(URl : String; aRoute : TRoute; Params: TStrings);
var
  s : string;
begin
  S:=Params.Values['ID'];
  document.body.innerHTML:='';
  // TDemoForm.Create(StrToIntDef(S,1),True);
  WriteLn(StrToIntDef(S,1));
end; 

procedure TApplication.Run;
var
  form: TForm;
  menu: TMenu;
begin
  //write your own code here!
  //this will be shown in the browser's console
  WriteLn('Hello from Pas2JS!');

  //Setup routes
  RegisterRoutes;
  Router.Push('form/1');

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
