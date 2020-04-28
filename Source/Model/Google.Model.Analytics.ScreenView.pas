unit Google.Model.Analytics.ScreenView;

interface

uses
  Google.Model.Analytics.Interfaces,
  Google.Controller.Analytics.Interfaces;

type
  TModelGoogleAnalyticsScreenView = Class(TInterfacedObject, iModelGoogleScreeView, iCommand)
  private
    [weak]
    FParent: iControllerGoogleAnalytics;
    FScreenName: String;
  public
    constructor Create(AParent: iControllerGoogleAnalytics);
    destructor Destroy; override;
    class function New(AParent: iControllerGoogleAnalytics): iModelGoogleScreeView;

    //iGoogleScreeView
    function ScreenName: String; overload;
    function ScreenName(Value: String): iModelGoogleScreeView; overload;
    function Send: iCommand;

    //iCommand
    function Execute: iCommand;
  End;

implementation

{ TModelGoogleAnalyticsScreenView }

uses
  System.Net.HttpClientComponent, System.Classes, System.SysUtils;

constructor TModelGoogleAnalyticsScreenView.Create(AParent: iControllerGoogleAnalytics);
begin
  FParent :=  AParent;
end;

destructor TModelGoogleAnalyticsScreenView.Destroy;
begin

  inherited;
end;

function TModelGoogleAnalyticsScreenView.Execute: iCommand;
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

      Params.Values['t']  := 'screenview';
      Params.Values['an'] := FParent.AppInfo.AppName;
      Params.Values['av'] := FParent.AppInfo.AppVersion;
      Params.Values['aid']  := FParent.AppInfo.AppID;
      Params.Values['aiid'] := FParent.AppInfo.AppInstalerID;

      Params.Values['cd']   := FScreenName;

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

class function TModelGoogleAnalyticsScreenView.New(AParent: iControllerGoogleAnalytics): iModelGoogleScreeView;
begin
  Result := Self.Create(AParent);
end;

function TModelGoogleAnalyticsScreenView.ScreenName(
  Value: String): iModelGoogleScreeView;
begin
  Result  :=  Self;

  FScreenName :=  Value;
end;

function TModelGoogleAnalyticsScreenView.Send: iCommand;
begin
  Result  :=  Self;
end;

function TModelGoogleAnalyticsScreenView.ScreenName: String;
begin
  Result  :=  FScreenName;
end;

end.

