unit uServer;

interface

uses
  System.SysUtils, System.Classes, Sparkle.HttpServer.Module,
  Sparkle.HttpServer.Context, Sparkle.Comp.Server,
  Sparkle.Comp.HttpSysDispatcher, Aurelius.Drivers.Interfaces,
  Aurelius.Comp.Connection, XData.Comp.ConnectionPool, XData.Server.Module,
  XData.Comp.Server, Sparkle.Comp.JwtMiddleware;

type
  TServerContainer = class(TDataModule)
    SparkleHttpSysDispatcher: TSparkleHttpSysDispatcher;
    XDataServer: TXDataServer;
    XDataServerJWT: TSparkleJwtMiddleware;
    procedure XDataServerJWTGetSecret(Sender: TObject; var Secret: string);
  end;

var
  ServerContainer: TServerContainer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  uLoginServiceImplementation;

{$R *.dfm}

procedure TServerContainer.XDataServerJWTGetSecret(Sender: TObject;
  var Secret: string);
begin
   Secret := TLoginService.GetSecret;
end;

end.
