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
  Home, Menu;

type

  TApplication = class
  private
    { private declarations }
    myDiv: TJSElement;
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
  myDiv := document.createElement('div');
  myDiv.id := 'formContainer';
  Run;
end;

procedure TApplication.Run;
var
  home: THome;
  menu: TMenu;
begin
  //write your own code here!
  //this will be shown in the browser's console
  WriteLn('Hello from Pas2JS!');

  //Setup routes
  RegisterRoutes;

  //instantiate components
  home:= THome.Create;
  menu:= TMenu.Create;

  //add to the screen
  document.body.appendChild( menu.Get );
  myDiv.appendChild( home.Get );
  document.body.appendChild( myDiv );
end;

procedure TApplication.RegisterRoutes;
begin
  Router.InitHistory(hkHash);
  //if default route, you can pass true as 3rd param
  // Router.RegisterRoute('/', @HandleRoutes, false);
  // Router.RegisterRoute('form/:ID', @HandleRoutes, true);
  Router.RegisterRoute('clients', @HandleRoutes, false);
  Router.RegisterRoute('products', @HandleRoutes, false);
  Router.RegisterRoute('inventory', @HandleRoutes, false);
  Router.RegisterRoute('logout', @HandleRoutes, false);
end;

procedure TApplication.HandleRoutes(URl : String; aRoute : TRoute; Params: TStrings);
var
  s: string;
begin
  // s:=Params.Values['ID'];
  myDiv.innerHTML := '';
  myDiv.innerHTML := aRoute.URLPattern;
  // TDemoForm.Create(StrToIntDef(S,1),True);
  // WriteLn(StrToIntDef(S,1));
end; 

destructor TApplication.Destroy;
begin
    inherited Destroy;
end;

end.
