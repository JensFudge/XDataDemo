program XDataClient;

uses
  Vcl.Forms,
  uMainClient in 'uMainClient.pas' {Form1},
  uDMClient in 'uDMClient.pas' {dmClient: TDataModule},
  uLoginService in '..\Server\uLoginService.pas',
  uArcheryService in '..\Server\uArcheryService.pas',
  uArcheryClass in '..\Server\uArcheryClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmClient, dmClient);
  Application.Run;
end.
