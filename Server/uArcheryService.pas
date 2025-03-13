unit uArcheryService;

interface

uses
  XData.Service.Common,
  xdata.security.attributes,
  uArcheryClass;

type
  [ServiceContract]
  IArcheryService = interface(IInvokable)
    ['{FCF6A8F8-C23E-4B98-AFEC-7A2A4B13A07B}']

    [Authorize]
    [httpGet]
    Function Archers : TArchers;

    [httpGet]
    Function ArcheryResults : TArcherResults;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(IArcheryService));

end.
