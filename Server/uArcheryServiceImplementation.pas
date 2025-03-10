unit uArcheryServiceImplementation;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  uArcheryService, uArcheryClass, uArcheryDB;

type
  [ServiceImplementation]
  TArcheryService = class(TInterfacedObject, IArcheryService)
    Function Archers : TArchers;
    Function ArcheryResults : TArcherResults;
  end;

implementation


{ TArcheryService }

function TArcheryService.Archers: TArchers;
begin
  result :=  TArcheryDB.getArchers;
end;

function TArcheryService.ArcheryResults: TArcherResults;
begin
  result := TArcheryDB.getArcherResults;
end;

initialization
  RegisterServiceType(TArcheryService);

end.
