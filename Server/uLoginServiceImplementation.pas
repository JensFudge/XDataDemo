unit uLoginServiceImplementation;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  uLoginService;

type
  [ServiceImplementation]
  TLoginService = class(TInterfacedObject, ILoginService)
  end;

implementation


initialization
  RegisterServiceType(TLoginService);

end.
