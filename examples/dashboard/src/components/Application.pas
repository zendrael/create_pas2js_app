unit Application;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Web, JS,
  //add your components
  Greeting, Background, Menu;

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
  greeting: TGreeting;
  bg: TBackground;
  menu: TMenu;
begin
  //write your own code here!
  WriteLn('Hello from Pas2JS!');

  //instantiate components
  greeting:= TGreeting.Create;
  bg:= TBackground.Create;
  menu:= TMenu.Create;

  //add to the screen
  // document.body.appendChild( greeting.Get );
  // document.body.appendChild( bg.Get );
  document.body.appendChild( menu.Get );
end;

destructor TApplication.Destroy;
begin
    inherited Destroy;
end;

end.
