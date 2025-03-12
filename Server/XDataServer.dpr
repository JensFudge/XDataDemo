program XDataServer;

uses
  Vcl.Forms,
  uServer in 'uServer.pas' {ServerContainer: TDataModule},
  uMainfrm in 'uMainfrm.pas' {MainForm},
  uHelloWorldService in 'uHelloWorldService.pas',
  uHelloWorldServiceImplementation in 'uHelloWorldServiceImplementation.pas',
  uArcheryClass in 'uArcheryClass.pas',
  uArcheryDB in 'uArcheryDB.pas',
  uArcheryService in 'uArcheryService.pas',
  uArcheryServiceImplementation in 'uArcheryServiceImplementation.pas',
  uLoginService in 'uLoginService.pas',
  uLoginServiceImplementation in 'uLoginServiceImplementation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
