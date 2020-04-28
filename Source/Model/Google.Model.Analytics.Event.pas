unit Google.Model.Analytics.Event;

interface

uses
  Google.Model.Analytics.Interfaces,
  Google.Controller.Analytics.Interfaces;

type
  TModelGoogleAnalyticsEvent = Class(TInterfacedObject, iModelGoogleEvent, iCommand)
  private
    [weak]
    FParent: iControllerGoogleAnalytics;

    FCategory: String;
    FAction: String;
    FEventLabel: String;
    FEventValue: Integer;
  public
    constructor Create(AParent: iControllerGoogleAnalytics);
    destructor Destroy; override;
    class function New(AParent: iControllerGoogleAnalytics): iModelGoogleEvent;

    //iModelGoogleEvent
    function Category: String; overload;
    function Category(Value: String): iModelGoogleEvent; overload;
    function Action: String; overload;
    function Action(Value: String): iModelGoogleEvent; overload;
    function EventLabel: String; overload;
    function EventLabel(Value: String): iModelGoogleEvent; overload;
    function EventValue: Integer; overload;
    function EventValue(Value: Integer): iModelGoogleEvent; overload;
    function Send: iCommand;

    //iCommand
    function Execute: iCommand;
  End;

implementation

{ TModelGoogleAnalyticsEvent }

uses
  System.Net.HttpClientComponent, System.Classes, System.SysUtils;

function TModelGoogleAnalyticsEvent.Action(Value: String): iModelGoogleEvent;
begin
  Result  :=  Self;

  FAction :=  Value;
end;

function TModelGoogleAnalyticsEvent.Action: String;
begin
  Result  :=  FAction;
end;

function TModelGoogleAnalyticsEvent.Category: String;
begin
  Result  :=  FCategory;
end;

function TModelGoogleAnalyticsEvent.Category(Value: String): iModelGoogleEvent;
begin
  Result  :=  Self;

  FCategory :=  Value;
end;

constructor TModelGoogleAnalyticsEvent.Create(AParent: iControllerGoogleAnalytics);
begin
  FParent :=  AParent;
end;

destructor TModelGoogleAnalyticsEvent.Destroy;
begin

  inherited;
end;

function TModelGoogleAnalyticsEvent.EventLabel(
  Value: String): iModelGoogleEvent;
begin
  Result  :=  Self;

  FEventLabel :=  Value;
end;

function TModelGoogleAnalyticsEvent.EventLabel: String;
begin
  Result  :=  FEventLabel;
end;

function TModelGoogleAnalyticsEvent.EventValue: Integer;
begin
  Result  :=  FEventValue;
end;

function TModelGoogleAnalyticsEvent.EventValue(
  Value: Integer): iModelGoogleEvent;
begin
  Result  :=  Self;

  FEventValue :=  Value;
end;

function TModelGoogleAnalyticsEvent.Execute: iCommand;
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
      Params.Values['t']  := 'event';
      Params.Values['ec'] := FCategory;
      Params.Values['ea'] := FAction;
      Params.Values['el'] := FEventLabel;
      Params.Values['ev'] := FEventValue.ToString;

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


class function TModelGoogleAnalyticsEvent.New(AParent: iControllerGoogleAnalytics): iModelGoogleEvent;
begin
  Result := Self.Create(AParent);
end;

function TModelGoogleAnalyticsEvent.Send: iCommand;
begin
  Result  :=  Self;
end;

end.

