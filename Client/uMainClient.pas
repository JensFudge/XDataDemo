unit uMainClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDMClient, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    edUserName: TLabeledEdit;
    edPass: TLabeledEdit;
    btnLogon: TButton;
    edJwt: TLabeledEdit;
    btnGetArchers: TButton;
    mmoArchers: TMemo;
    btnGetResults: TButton;
    procedure btnLogonClick(Sender: TObject);
    procedure btnGetArchersClick(Sender: TObject);
    procedure btnGetResultsClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}
uses

XData.Client,
uLoginService,
uArcheryService,
uArcheryClass;


procedure TForm1.btnGetResultsClick(Sender: TObject);
begin
  var lService := dmClient.XdataClient.Service<IArcheryService>;
  var lArcherResults  := lService.ArcheryResults;
  mmoArchers.Lines.Clear;
  for var lArcherRes  in lArcherResults  do
    begin
      mmoArchers.Lines.Add(lArcherRes.CompetitionName + ' ' + lArcherRes.CompeitionResult.ToString);
    end;
end;

procedure TForm1.btnLogonClick(Sender: TObject);
begin
  var lService :=  dmClient.XdataClient.Service<ILoginService>;
  var lJWT := lService.Login(edUserName.Text, edPass.Text);
  edJwt.Text := lJWT;
  dmClient.jwtToken := lJWT;
end;

procedure TForm1.btnGetArchersClick(Sender: TObject);
begin
  var lService := dmClient.XdataClient.Service<IArcheryService>;
  var lArchers := lService.Archers;
  mmoArchers.Lines.Clear;
  for var lArcher  in lArchers  do
    begin
      mmoArchers.Lines.Add(lArcher.Name + ' ' + lArcher.bowType);
    end;
end;

end.
