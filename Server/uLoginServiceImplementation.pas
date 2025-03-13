unit uLoginServiceImplementation;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  uLoginService;

type
  [ServiceImplementation]
  TLoginService = class(TInterfacedObject, ILoginService)
  private
  function CreateToken (username : string) : string;

  function ValidateUser(aUsername, aPass : string) : Boolean;
  public
  function Login(Username, Pass: string) : String;
  Class function GetSecret : string;
  end;

implementation


{ TLoginService }

uses
  System.DateUtils,
  System.SysUtils,
  Bcl.jose.Core.Builder,
  Bcl.Jose.Core.JWT;

function TLoginService.CreateToken(username: string): string;
begin
    var lToken := TJWT.Create;
  try
    lToken.Claims.IssuedAt := TDateTime.NowUtc;
    lToken.Claims.Expiration := TDateTime.NowUTC.IncDay(1);
    lToken.Claims.Issuer := 'Jens Fudge';

    lToken.Claims.SetClaimOfType<string>('User', username); //Så er username gemt i token



    //This will create a token as a string representation
    Result := TJOSE.SHA256CompactToken(
     TLoginService.GetSecret,
      lToken
    );
  finally
    lToken.Free;
  end;
end;

Class function TLoginService.GetSecret: string;
begin
  //Can be any string
  result :=  '{38FA69F9-EE71-4705-B8D6-FD6E7D67B90A}';
end;

function TLoginService.Login(Username, Pass: string): String;
begin
  If validateUser(Username, Pass) then
    result := CreateToken(Username)
  else
    result := 'Not validated';
end;

function TLoginService.ValidateUser(aUsername, aPass: string): Boolean;
begin
  Result := AnsiUppercase( aUsername) = AnsiUpperCase( aPass);
end;

initialization
  RegisterServiceType(TLoginService);

end.
