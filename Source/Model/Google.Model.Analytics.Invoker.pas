unit Google.Model.Analytics.Invoker;

interface

uses
  Google.Model.Analytics.Interfaces, System.Generics.Collections;

type
  TModelGoogleAnalyticsInvoker = class(TInterfacedObject, iInvoker)
  private
    FList: TList<iCommand>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iInvoker;

    function Add(Value: iCommand): iInvoker;
    function Execute: iInvoker;
  end;

implementation

uses
  System.SysUtils,
  System.Classes;

{ TModelGoogleAnalyticsInvoker }

function TModelGoogleAnalyticsInvoker.Add(Value: iCommand): iInvoker;
begin
  Result  :=  Self;

  FList.Add(Value);
end;

constructor TModelGoogleAnalyticsInvoker.Create;
begin
  FList:= TList<iCommand>.Create;
end;

destructor TModelGoogleAnalyticsInvoker.Destroy;
begin
  FreeAndNil(FList);

  inherited;
end;

function TModelGoogleAnalyticsInvoker.Execute: iInvoker;
Var
  Command: iCommand;
begin
  Result  :=  Self;

  for Command in FList do
  begin
    TThread.CreateAnonymousThread(
      procedure
      begin
        Command.Execute;
      end)
    .Start;
  end;

end;

class function TModelGoogleAnalyticsInvoker.New: iInvoker;
begin
  Result := Self.Create;
end;

end.

