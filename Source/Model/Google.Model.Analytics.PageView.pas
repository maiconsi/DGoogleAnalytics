unit Google.Model.Analytics.PageView;

interface

uses
  Google.Model.Analytics.Interfaces,
  Google.Controller.Analytics.Interfaces;

type
  TModelGoogleAnalyticsPageView = Class(TInterfacedObject, iModelGooglePageView, iCommand)
  private
    [weak]
    FParent: iControllerGoogleAnalytics;

    FHostName: String;
    FPage: String;
    FTitle: String;
  public
    constructor Create(AParent: iControllerGoogleAnalytics);
    destructor Destroy; override;
    class function New(AParent: iControllerGoogleAnalytics): iModelGooglePageView;

    //iModelGooglePageView
    function DocumentHostName: String; overload;
    function DocumentHostName(Value: String): iModelGooglePageView; overload;
    function Page: String; overload;
    function Page(Value: String): iModelGooglePageView; overload;
    function Title: String; overload;
    function Title(Value: String): iModelGooglePageView; overload;
    function Send: iCommand;

    //iCommand
    function Execute: iCommand;
  End;

implementation

{ TModelGoogleAnalyticsPageView }

uses
  System.Net.HttpClientComponent, System.Classes, System.SysUtils;

constructor TModelGoogleAnalyticsPageView.Create(AParent: iControllerGoogleAnalytics);
begin
  FParent :=  AParent;
end;

destructor TModelGoogleAnalyticsPageView.Destroy;
begin

  inherited;
end;

function TModelGoogleAnalyticsPageView.Execute: iCommand;
var
  HTTPClient: TNetHTTPClient;
  Params: TStringList;
begin
  Result  :=  Self;

  HTTPClient:= TNetHTTPClient.Create(nil);
  try
    Params := TStringList.Create;
    try
      Params.Values['v']  := '1';
      Params.Values['tid']:= FParent.GooglePropertyID;

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

      (*AppInfo*)
      if FParent.AppInfo.AppName <> '' then
        Params.Values['an'] := FParent.AppInfo.AppName;
      if FParent.AppInfo.AppVersion <> '' then
        Params.Values['av'] := FParent.AppInfo.AppVersion;
      if FParent.AppInfo.AppID <> '' then
        Params.Values['aid']  := FParent.AppInfo.AppID;
      if FParent.AppInfo.AppInstalerID <> '' then
        Params.Values['aiid'] := FParent.AppInfo.AppInstalerID;

      (*PageView*)
      Params.Values['t']  := 'pageview';
      Params.Values['dh'] := FHostName;
      Params.Values['dp'] := FPage;
      Params.Values['dt'] := FTitle;
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

function TModelGoogleAnalyticsPageView.DocumentHostName: String;
begin
  Result  :=  FHostName;
end;

function TModelGoogleAnalyticsPageView.DocumentHostName(
  Value: String): iModelGooglePageView;
begin
  Result  :=  Self;

  FHostName :=  Value;
end;

class function TModelGoogleAnalyticsPageView.New(AParent: iControllerGoogleAnalytics): iModelGooglePageView;
begin
  Result := Self.Create(AParent);
end;

function TModelGoogleAnalyticsPageView.Page(
  Value: String): iModelGooglePageView;
begin
  Result  :=  Self;

  FPage :=  Value;
end;

function TModelGoogleAnalyticsPageView.Page: String;
begin
  Result  :=  FPage;
end;

function TModelGoogleAnalyticsPageView.Send: iCommand;
begin
  Result  :=  Self;
end;

function TModelGoogleAnalyticsPageView.Title(
  Value: String): iModelGooglePageView;
begin
  Result  :=  Self;

  FTitle :=  Value;
end;

function TModelGoogleAnalyticsPageView.Title: String;
begin
  Result  :=  FTitle;
end;

end.

