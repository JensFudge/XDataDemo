unit uHelloWorldService;

interface

uses
  XData.Service.Common;

type
  [ServiceContract]
  IHelloWorldService = interface(IInvokable)
    ['{BDD66CED-4261-48C6-84CC-39453AC90985}']
    [HttpGet]
    function Sum(A, B: double): double;
    // By default, any service operation responds to (is invoked by) a POST request from the client.
    function EchoString(Value: string): string;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(IHelloWorldService));

end.
