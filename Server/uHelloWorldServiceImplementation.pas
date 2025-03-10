unit uHelloWorldServiceImplementation;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  uHelloWorldService;

type
  [ServiceImplementation]
  THelloWorldService = class(TInterfacedObject, IHelloWorldService)
  private
    function Sum(A, B: double): double;
    function EchoString(Value: string): string;
  end;

implementation

function THelloWorldService.Sum(A, B: double): double;
begin
  Result := A + B;
end;

function THelloWorldService.EchoString(Value: string): string;
begin
  Result := Value;
end;

initialization
  RegisterServiceType(THelloWorldService);

end.
