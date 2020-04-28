unit Google.Model.Analytics.Interfaces;

interface

type
  TOperationSession = (osStart, osEnd);

  iCommand = interface
    ['{B7514473-F219-4FC2-B67E-97D0138DE38C}']
    function Execute: iCommand;
  end;

  iInvoker = interface
    ['{7C0D535E-EB23-447A-82AE-EDE881C37F60}']
    function Add(Value: iCommand): iInvoker;
    function Execute: iInvoker;
  end;

  iModelGoogleAppInfo = interface
    ['{19A03691-80BC-413E-A6F5-EB27E91F1648}']
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
  end;

  iModelGoogleEvent = interface
    ['{42F17F3B-099D-4E0D-BCE7-FED8B78C97D6}']
    function Category: String; overload;
    function Category(Value: String): iModelGoogleEvent; overload;
    function Action: String; overload;
    function Action(Value: String): iModelGoogleEvent; overload;
    function EventLabel: String; overload;
    function EventLabel(Value: String): iModelGoogleEvent; overload;
    function EventValue: Integer; overload;
    function EventValue(Value: Integer): iModelGoogleEvent; overload;
    function Send: iCommand;
  end;

  iModelGoogleException = interface
    ['{B64974BB-1D90-4CF9-BB11-04D6FF7B573C}']
    function Description: String; overload;
    function Description(Value: String): iModelGoogleException; overload;
    function isFatal: Boolean; overload;
    function isFatal(Value: Boolean): iModelGoogleException; overload;
    function Send: iCommand;
  end;

  iModelGoogleScreeView = interface
    ['{0E97F395-EA31-4F46-8E21-CA0F1AF9FA35}']
    function ScreenName: String; overload;
    function ScreenName(Value: String): iModelGoogleScreeView; overload;
    function Send: iCommand;
  end;

  iModelGooglePageView = interface
    ['{91B15DC3-50AC-493B-894E-815AE8A40708}']
    function DocumentHostName: String; overload;
    function DocumentHostName(Value: String): iModelGooglePageView; overload;
    function Page: String; overload;
    function Page(Value: String): iModelGooglePageView; overload;
    function Title: String; overload;
    function Title(Value: String): iModelGooglePageView; overload;
    function Send: iCommand;
  end;

  iModelGoogleSession = interface
    ['{66E614FD-5CC5-4457-97EE-7173FB3274F0}']
    function Operation(AOperation: TOperationSession): iModelGoogleSession; overload;
    function Operation: TOperationSession; overload;
    function Send: iCommand;
  end;

implementation

end.

