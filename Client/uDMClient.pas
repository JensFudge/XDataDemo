unit uDMClient;

interface

uses
  System.SysUtils, System.Classes,
  XData.Client, Sparkle.Http.Client;

type
  TdmClient = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FjwtToken: string;
    fXDataClient : TXDataClient;
    function getXdataClient: TXDataClient;
    procedure SetjwtToken(const Value: string);
    procedure SendClientRequest(ARequest: THttpRequest);
    { Private declarations }

  public
    { Public declarations }
    property XdataClient : TXDataClient read getXdataClient;
    property jwtToken : string read FjwtToken write SetjwtToken;
  end;

var
  dmClient: TdmClient;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmClient.DataModuleCreate(Sender: TObject);
begin
 self.fXDataClient := TXDataClient.Create;
 self.fXDataClient.Uri :=  'http://localhost:2001/tms/xdata';
 self.fXDataClient.HttpClient.OnSendingRequest := self.SendClientRequest;
end;

procedure TdmClient.DataModuleDestroy(Sender: TObject);
begin
  self.fXDataClient.Free;
end;

function TdmClient.getXdataClient: TXDataClient;
begin
  Result := fXDataClient;
end;

procedure TdmClient.SetjwtToken(const Value: string);
begin
  FjwtToken := Value;
end;

procedure TdmClient.SendClientRequest(ARequest: THttpRequest);
begin
  if FjwtToken <> '' then
  begin
    ARequest.Headers.SetValue('Authorization', 'Bearer ' + FjwtToken);
  end;
end;


end.
