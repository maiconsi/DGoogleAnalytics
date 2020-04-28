unit Google.Model.Analytics.Exception;

interface

uses
  Google.Model.Analytics.Interfaces,
  Google.Controller.Analytics.Interfaces;

type
  TModelGoogleAnalyticsException = Class(TInterfacedObject, iModelGoogleException, iCommand)
  private
    [weak]
    FParent: iControllerGoogleAnalytics;
    FDescription: String;
    FisFatal: Boolean;
  public
    constructor Create(AParent: iControllerGoogleAnalytics);
    destructor Destroy; override;
    class function New(AParent: iControllerGoogleAnalytics): iModelGoogleException;

    //iModelGoogleException
    function Description: String; overload;
    function Description(Value: String): iModelGoogleException; overload;
    function isFatal: Boolean; overload;
    function isFatal(Value: Boolean): iModelGoogleException; overload;
    function Send: iCommand;

    //iCommand
    function Execute: iCommand;
  End;

implementation

{ TModelGoogleAnalyticsException }

uses
  System.Net.HttpClientComponent, System.Classes, System.SysUtils, System.StrUtils;

constructor TModelGoogleAnalyticsException.Create(AParent: iControllerGoogleAnalytics);
begin
  FParent :=  AParent;
end;

function TModelGoogleAnalyticsException.Description: String;
begin
  Result  :=  FDescription;
end;

function TModelGoogleAnalyticsException.Description(
  Value: String): iModelGoogleException;
begin
  Result  :=  Self;

  FDescription  :=  Value;
end;

destructor TModelGoogleAnalyticsException.Destroy;
begin

  inherited;
end;

function TModelGoogleAnalyticsException.Execute: iCommand;
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

      Params.Values['t']  := 'exception';
      Params.Values['exd'] := FDescription;
      Params.Values['exf'] := IfThen(FisFatal, '1', '0');

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

function TModelGoogleAnalyticsException.isFatal: Boolean;
begin
  Result  :=  FisFatal;
end;

function TModelGoogleAnalyticsException.isFatal(
  Value: Boolean): iModelGoogleException;
begin
  Result  :=  Self;

  FisFatal  :=  Value;
end;

class function TModelGoogleAnalyticsException.New(AParent: iControllerGoogleAnalytics): iModelGoogleException;
begin
  Result := Self.Create(AParent);
end;

function TModelGoogleAnalyticsException.Send: iCommand;
begin
  Result  :=  Self;
end;

end.

