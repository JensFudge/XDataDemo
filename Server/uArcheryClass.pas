unit uArcheryClass;

interface

 uses
   Generics.Collections;

Type
  TArcher = class
    private
    Fname: string;
    FID: Integer;
    FBowType: string;
    procedure SetBowType(const Value: string);
    procedure SetID(const Value: Integer);
    procedure Setname(const Value: string);
    public
    property ID : Integer read FID write SetID;
    property name : string read Fname write Setname;
    property BowType : string read FBowType write SetBowType;
  end;

  TArchers = class(TObjectList<TArcher> )

  end;


  TArcherResult = class(TObject)
    private
    FID: integer;
    FCompeitionResult: Integer;
    FArcherID: Integer;
    FCompetitionName: string;
    procedure SetArcherID(const Value: Integer);
    procedure SetCompeitionResult(const Value: Integer);
    procedure SetCompetitionName(const Value: string);
    procedure SetID(const Value: integer);
    public
      property ID : integer read FID write SetID;
      property ArcherID : Integer read FArcherID write SetArcherID;
      property CompetitionName : string read FCompetitionName write SetCompetitionName;
      property CompetitionResult : Integer read FCompeitionResult write SetCompeitionResult;
  end;

  TArcherResults = class(TObjectList<TArcherResult>)
  end;




implementation

{ TArcher }

procedure TArcher.SetBowType(const Value: string);
begin
  FBowType := Value;
end;

procedure TArcher.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TArcher.Setname(const Value: string);
begin
  Fname := Value;
end;

{ TArcherResult }

procedure TArcherResult.SetArcherID(const Value: Integer);
begin
  FArcherID := Value;
end;

procedure TArcherResult.SetCompeitionResult(const Value: Integer);
begin
  FCompeitionResult := Value;
end;

procedure TArcherResult.SetCompetitionName(const Value: string);
begin
  FCompetitionName := Value;
end;

procedure TArcherResult.SetID(const Value: integer);
begin
  FID := Value;
end;

end.
