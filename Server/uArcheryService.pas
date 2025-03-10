unit uArcheryService;

interface

uses
  XData.Service.Common, uArcheryClass;

type
  [ServiceContract]
  IArcheryService = interface(IInvokable)
    ['{FCF6A8F8-C23E-4B98-AFEC-7A2A4B13A07B}']

    [httpGet]
    Function Archers : TArchers;

    [httpGet]
    Function ArcheryResults : TArcherResults;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(IArcheryService));

end.
