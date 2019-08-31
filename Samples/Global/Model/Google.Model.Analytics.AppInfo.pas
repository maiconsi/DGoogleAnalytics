unit Google.Model.Analytics.AppInfo;

interface

uses
  Google.Model.Analytics.Interfaces;

type
  TModelGoogleAppInfo = Class(TInterfacedObject, iModelGoogleAppInfo)
  private
    FAppName: String;
    FAppVersion: String;
    FAppID: String;
    FAppInstalerID: String;
    FAppLicense: String;
    FAppEdition: String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelGoogleAppInfo;

    function AppName: String; overload;
    function AppName(Value: String): iModelGoogleAppInfo; overload;
    function AppVersion: String; overload;
    function AppVersion(Value: String): iModelGoogleAppInfo; overload;
    function AppID: String; overload;
    function AppID(Value: String): iModelGoogleAppInfo; overload;
    function AppInstalerID: String; overload;
    function AppInstalerID(Value: String): iModelGoogleAppInfo; overload;
    function AppLicense: String; overload;
    function AppLicense(Value: String): iModelGoogleAppInfo; overload;
    function AppEdition: String; overload;
    function AppEdition(Value: String): iModelGoogleAppInfo; overload;
  End;

implementation

{ TModelGoogleApp }

function TModelGoogleAppInfo.AppEdition(Value: String): iModelGoogleAppInfo;
begin
  Result  :=  Self;

  FAppEdition  :=  Value;
end;

function TModelGoogleAppInfo.AppID: String;
begin
  Result  :=  FAppID;
end;

function TModelGoogleAppInfo.AppID(Value: String): iModelGoogleAppInfo;
begin
  Result  :=  Self;

  FAppID  :=  Value;
end;

function TModelGoogleAppInfo.AppInstalerID: String;
begin
  Result  :=  FAppInstalerID;
end;

function TModelGoogleAppInfo.AppInstalerID(Value: String): iModelGoogleAppInfo;
begin
  Result  :=  Self;

  FAppInstalerID  :=  Value;
end;

function TModelGoogleAppInfo.AppEdition: String;
begin
  Result  :=  FAppEdition;
end;

function TModelGoogleAppInfo.AppLicense(Value: String): iModelGoogleAppInfo;
begin
  Result  :=  Self;

  FAppLicense  :=  Value;
end;

function TModelGoogleAppInfo.AppLicense: String;
begin
  Result  :=  FAppLicense;
end;

function TModelGoogleAppInfo.AppName: String;
begin
  Result  :=  FAppName;
end;

function TModelGoogleAppInfo.AppName(Value: String): iModelGoogleAppInfo;
begin
  Result  :=  Self;

  FAppName  :=  Value;
end;

function TModelGoogleAppInfo.AppVersion: String;
begin
  Result  :=  FAppVersion;
end;

function TModelGoogleAppInfo.AppVersion(Value: String): iModelGoogleAppInfo;
begin
Result  :=  Self;

  FAppVersion  :=  Value;
end;

constructor TModelGoogleAppInfo.Create;
begin

end;

destructor TModelGoogleAppInfo.Destroy;
begin

  inherited;
end;

class function TModelGoogleAppInfo.New: iModelGoogleAppInfo;
begin
  Result := Self.Create;
end;

end.

