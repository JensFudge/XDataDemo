unit uMainClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDMClient, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls,
  uArcheryService,
  uArcheryClass;

type
  TForm1 = class(TForm)
    edUserName: TLabeledEdit;
    edPass: TLabeledEdit;
    btnLogon: TButton;
    edJwt: TLabeledEdit;
    btnGetArchers: TButton;
    mmoArchers: TMemo;
    btnGetResults: TButton;
    mmoResults: TMemo;
    btnCreateXlsx: TButton;
    odXlsx: TOpenDialog;
    sdReport: TSaveDialog;
    procedure btnLogonClick(Sender: TObject);
    procedure btnGetArchersClick(Sender: TObject);
    procedure btnGetResultsClick(Sender: TObject);
    procedure btnCreateXlsxClick(Sender: TObject);
  private
    fArchers : TArchers;
    fResults : TArcherResults;
    procedure CreateReport(const atemplateFile, aoutputFile: string);
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
  FlexCel.VCLSupport,
  FlexCel.Core,
  FlexCel.XlsAdapter,
  FlexCel.Report,
  FlexCel.Render,
  uLoginService,
  System.ioUtils;


procedure TForm1.btnGetResultsClick(Sender: TObject);
begin
  var lService := dmClient.XdataClient.Service<IArcheryService>;
  var lArcherResults  := lService.ArcheryResults;
  fResults := lArcherResults;
  mmoResults.Lines.Clear;
  for var lArcherRes  in lArcherResults  do
    begin
      mmoResults.Lines.Add(lArcherRes.CompetitionName + ' ' + lArcherRes.CompetitionResult.ToString);
    end;
end;

procedure TForm1.btnLogonClick(Sender: TObject);
begin
  var lService :=  dmClient.XdataClient.Service<ILoginService>;
  var lJWT := lService.Login(edUserName.Text, edPass.Text);
  edJwt.Text := lJWT;
  dmClient.jwtToken := lJWT;
end;

procedure TForm1.btnCreateXlsxClick(Sender: TObject);
begin
  if odXlsx.Execute then
  begin
     var templateFile := odXlsx.FileName;
     if sdReport.Execute then
     begin
       var outputFile := sdReport.FileName;
       CreateReport(templateFile, outputFile);
     end;

  end;
end;


procedure TForm1.CreateReport(const atemplateFile, aoutputFile : string);
begin
  var lReport := TFlexcelReport.Create(true);
  try
    lReport.AddTable<TArcher>('ARCHER', fArchers);
    lReport.AddTable<TArcherResult>('RESULTS', fResults);
    lReport.AddRelationship('ARCHER','RESULTS', 'ID', 'ArcherID');

    var extension := TPath.GetExtension(aoutputFile);


    if extension = '.xlsx' then
      lReport.Run(atemplateFile , aoutputFile )
    else
    if extension = '.pdf' then
    begin


      var lxls := TXLSFile.Create(atemplateFile, true);
      var lpdf := TFlexCelPdfExport.Create(lxls, true);
      lReport.Run(lxls);
      lxls.AutofitCol(2,10, false, 1.1, 0, 0, 0);
      try
        lpdf.ExportAllVisibleSheets(aoutputFile, false, 'ARCHER');
      finally
         lxls.Free;
         lpdf.Free;
      end;
    end;
  finally
    lReport.Free;
  end;


end;

procedure TForm1.btnGetArchersClick(Sender: TObject);
begin
  var lService := dmClient.XdataClient.Service<IArcheryService>;
  var lArchers := lService.Archers;
  fArchers := lArchers;
  mmoArchers.Lines.Clear;
  for var lArcher  in lArchers  do
    begin
      mmoArchers.Lines.Add(lArcher.Name + ' ' + lArcher.bowType);
    end;
end;

end.
