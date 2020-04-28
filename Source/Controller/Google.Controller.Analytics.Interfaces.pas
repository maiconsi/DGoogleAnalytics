unit Google.Controller.Analytics.Interfaces;

interface

uses
  Google.Model.Analytics.Interfaces;

type
  iControllerGoogleAnalytics = interface
    ['{7D7E3C3C-7A5C-4EBB-A7B0-65603FF317C6}']
    function GooglePropertyID: String; overload;
    function GooglePropertyID(Value: String): iControllerGoogleAnalytics; overload;
    function ClienteID: String; overload;
    function ClienteID(Value: String): iControllerGoogleAnalytics; overload;
    function UserID: String; overload;
    function UserID(Value: String): iControllerGoogleAnalytics; overload;

    function SystemPlatform: String;
    function ScreenResolution: String;

    function URL: String; overload;
    function URL(Value: String): iControllerGoogleAnalytics; overload;

    function AppInfo: iModelGoogleAppInfo;

    function Event(ACategory, AAction, ALabel: String; AValue: Integer = 0): iControllerGoogleAnalytics;
    function Exception(ADescription: String; AIsFatal: Boolean): iControllerGoogleAnalytics;
    function ScreenView(AScreenName: String): IControllerGoogleAnalytics;
    function PageView(ADocumentHostName, APage, ATitle: String): IControllerGoogleAnalytics;

    function StartSession: IControllerGoogleAnalytics;
    function EndSession: IControllerGoogleAnalytics;
  end;


implementation

end.

