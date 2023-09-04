unit Application;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Web, JS;

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
begin
  //write your own code here!
  WriteLn('Hello from Pas2JS!');
end;

destructor TApplication.Destroy;
begin
    inherited Destroy;
end;

end.
