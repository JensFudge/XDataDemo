unit uMainfrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, UServer;

type
  TMainForm = class(TForm)
    mmInfo: TMemo;
    btStart: TButton;
    btStop: TButton;
    Button1: TButton;
    procedure btStartClick(ASender: TObject);
    procedure btStopClick(ASender: TObject);
    procedure FormCreate(ASender: TObject);
    procedure Button1Click(Sender: TObject);
  strict private
    procedure UpdateGUI;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  winApi.ShellAPI;

resourcestring
  SServerStopped = 'Server stopped';
  SServerStartedAt = 'Server started at ';

{ TMainForm }

procedure TMainForm.btStartClick(ASender: TObject);
begin
  ServerContainer.SparkleHttpSysDispatcher.Start;
  UpdateGUI;
end;

procedure TMainForm.btStopClick(ASender: TObject);
begin
  ServerContainer.SparkleHttpSysDispatcher.Stop;
  UpdateGUI;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  var aUrl : string := ServerContainer.XDataServer.BaseUrl;
  aUrl := aUrl.Replace('+', 'localhost');
  ShellExecute (0, 'open', pChar(aUrl + '/$model'), '', '', SW_SHOWNORMAL);
  ShellExecute (0, 'open', pChar(aUrl + '/swaggerUI'), '', '', SW_SHOWNORMAL);
end;

procedure TMainForm.FormCreate(ASender: TObject);
begin
  UpdateGUI;
end;

procedure TMainForm.UpdateGUI;
const
  cHttp = 'http://+';
  cHttpLocalhost = 'http://localhost';
begin
  btStart.Enabled := not ServerContainer.SparkleHttpSysDispatcher.Active;
  btStop.Enabled := not btStart.Enabled;
  if ServerContainer.SparkleHttpSysDispatcher.Active then
    mmInfo.Lines.Add(SServerStartedAt + StringReplace(
      ServerContainer.XDataServer.BaseUrl,
      cHttp, cHttpLocalhost, [rfIgnoreCase]))
  else
    mmInfo.Lines.Add(SServerStopped);
end;

end.
