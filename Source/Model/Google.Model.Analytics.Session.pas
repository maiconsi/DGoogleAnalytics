unit Google.Model.Analytics.Session;

interface

uses
  Google.Model.Analytics.Interfaces,
  Google.Controller.Analytics.Interfaces;

type
  TModelGoogleAnalyticsSession = Class(TInterfacedObject, iModelGoogleSession, iCommand)
  private
    [weak]
    FParent: iControllerGoogleAnalytics;
    FOperation: TOperationSession;
  public
    constructor Create(AParent: iControllerGoogleAnalytics);
    destructor Destroy; override;
    class function New(AParent: iControllerGoogleAnalytics): iModelGoogleSession;

    //iModelGoogleSession
    function Operation(AOperation: TOperationSession): iModelGoogleSession; overload;
    function Operation: TOperationSession; overload;
    function Send: iCommand;

    //iCommand
    function Execute: iCommand;
  End;

implementation

{ TModelGoogleAnalyticsSession }

uses
  System.Net.HttpClientComponent, System.Classes, System.SysUtils;

constructor TModelGoogleAnalyticsSession.Create(AParent: iControllerGoogleAnalytics);
begin
  FParent :=  AParent;
  FOperation  :=  osStart;
end;

destructor TModelGoogleAnalyticsSession.Destroy;
begin

  inherited;
end;

function TModelGoogleAnalyticsSession.Execute: iCommand;
var
  HTTPClient: TNetHTTPClient;
  Params: TStringList;
begin
  Result  :=  Self;

  HTTPClient:= TNetHTTPClient.Create(nil);
  try
    Params := TStringList.Create;
    try
      Params.Values['v']  :=  '1';
      Params.Values['tid']:=  FParent.GooglePropertyID;

      Params.Values['cid']:= FParent.ClienteID;

      if FParent.UserID <> '' then
        Params.Values['uid']:=  FParent.UserID;

      Params.Values['ul'] :=  'pt-br';

      Params.Values['sr'] :=  FParent.ScreenResolution;

      Params.Values['cs'] :=  Format('%s %s', [
                                      FParent.AppInfo.AppName,
                                      FParent.AppInfo.AppVersion
                                      ]);

      Params.Values['cm'] :=  FParent.AppInfo.AppEdition;

      (*Event*)
      Params.Values['t']  :=  'event';
      Params.Values['ec'] :=  'Session';

      if FOperation = osStart then
      begin
        Params.Values['ea'] := 'Start';
        Params.Values['el'] := 'Start Session';

        Params.Values['sc'] := 'start';
      end
      else
      begin
        Params.Values['ea'] := 'End';
        Params.Values['el'] := 'End Session';

        Params.Values['sc'] := 'end';
      end;

      try
        HTTPClient.Post(FParent.URL, Params, nil, TEncoding.Default);
      except
      end;
    finally
      Params.Free;
    end;
  finally
    HTTPClient.Free;
  end;
end;


class function TModelGoogleAnalyticsSession.New(AParent: iControllerGoogleAnalytics): iModelGoogleSession;
begin
  Result := Self.Create(AParent);
end;

function TModelGoogleAnalyticsSession.Operation: TOperationSession;
begin
  Result  :=  FOperation;
end;

function TModelGoogleAnalyticsSession.Operation(
  AOperation: TOperationSession): iModelGoogleSession;
begin
  Result  :=  Self;

  FOperation  :=  AOperation;
end;

function TModelGoogleAnalyticsSession.Send: iCommand;
begin
  Result  :=  Self;
end;

end.

