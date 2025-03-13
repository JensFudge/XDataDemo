unit uLoginService;

interface

uses
  XData.Service.Common;

type
  [ServiceContract]
  ILoginService = interface(IInvokable)
    ['{B23FF9AA-A76F-4469-B6F9-652BCCEE7CF3}']

  [HttpPost]
  function Login(Username, Pass: string) : String;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(ILoginService));

end.
