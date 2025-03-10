unit uArcheryDB;

interface

uses
  uArcheryClass;

Type
  TArcheryDB = class
    private
    public
      Class function getArchers : TArchers;
      Class function getArcherResults : TArcherResults;
  end;

implementation

{ TArcheryDB }

class function TArcheryDB.getArcherResults: TArcherResults;
begin
   Result := TArcherResults.Create;

   var lArcherResult := TArcherResult.Create;
   lArcherResult.ID := 1;
   lArcherResult.ArcherID := 1;
   lArcherResult.CompetitionName := 'World Championship';
   lArcherResult.CompeitionResult := 1;
   Result.Add(lArcherResult);

   lArcherResult := TArcherResult.Create;
   lArcherResult.ID := 2;
   lArcherResult.ArcherID := 1;
   lArcherResult.CompetitionName := 'Danish Championship';
   lArcherResult.CompeitionResult := 1;
   Result.Add(lArcherResult);

   lArcherResult := TArcherResult.Create;
   lArcherResult.ID := 3;
   lArcherResult.ArcherID := 1;
   lArcherResult.CompetitionName := 'Kings of Archery';
   lArcherResult.CompeitionResult := 9;
   Result.Add(lArcherResult);


   lArcherResult := TArcherResult.Create;
   lArcherResult.ID := 5;
   lArcherResult.ArcherID := 2;
   lArcherResult.CompetitionName := 'European Championship';
   lArcherResult.CompeitionResult := 3;
   Result.Add(lArcherResult);

   lArcherResult := TArcherResult.Create;
   lArcherResult.ID := 6;
   lArcherResult.ArcherID := 2;
   lArcherResult.CompetitionName := 'Nimes';
   lArcherResult.CompeitionResult := 1;
   Result.Add(lArcherResult);

   lArcherResult := TArcherResult.Create;
   lArcherResult.ID := 7;
   lArcherResult.ArcherID := 3;
   lArcherResult.CompetitionName := 'World Championship';
   lArcherResult.CompeitionResult := 1;
   Result.Add(lArcherResult);

   lArcherResult := TArcherResult.Create;
   lArcherResult.ID := 8;
   lArcherResult.ArcherID := 3;
   lArcherResult.CompetitionName := 'Olympic Games';
   lArcherResult.CompeitionResult := 17;
   Result.Add(lArcherResult);



end;

class function TArcheryDB.getArchers: TArchers;
begin
  Result := TArchers.Create;

  var lArcher := TArcher.Create;
  lArcher.ID := 1;
  lArcher.name := 'Oliver';
  lArcher.BowType := 'Barebow';

  Result.Add(lArcher);

  lArcher := TArcher.Create;
  lArcher.ID := 2;
  lArcher.name := 'Nicklas';
  lArcher.BowType := 'Compound';

  Result.Add(lArcher);

  lArcher := TArcher.Create;
  lArcher.ID := 3;
  lArcher.name := 'Maja';
  lArcher.BowType := 'Olympic Recurve';

  Result.Add(lArcher);

end;

end.
