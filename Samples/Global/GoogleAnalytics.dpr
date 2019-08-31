program GoogleAnalytics;

uses
  Vcl.Forms,
  Google.View.Principal in 'View\Google.View.Principal.pas' {frmPrincipal},
  GoogleAnalyticsGlobal in 'GoogleAnalyticsGlobal.pas',
  Google.Controller.Analytics.Interfaces in '..\..\Source\Controller\Google.Controller.Analytics.Interfaces.pas',
  Google.Controller.Analytics in '..\..\Source\Controller\Google.Controller.Analytics.pas',
  Google.Model.Analytics.AppInfo in '..\..\Source\Model\Google.Model.Analytics.AppInfo.pas',
  Google.Model.Analytics.Event in '..\..\Source\Model\Google.Model.Analytics.Event.pas',
  Google.Model.Analytics.Exception in '..\..\Source\Model\Google.Model.Analytics.Exception.pas',
  Google.Model.Analytics.Factory.Interfaces in '..\..\Source\Model\Google.Model.Analytics.Factory.Interfaces.pas',
  Google.Model.Analytics.Factory in '..\..\Source\Model\Google.Model.Analytics.Factory.pas',
  Google.Model.Analytics.Interfaces in '..\..\Source\Model\Google.Model.Analytics.Interfaces.pas',
  Google.Model.Analytics.Invoker in '..\..\Source\Model\Google.Model.Analytics.Invoker.pas',
  Google.Model.Analytics.PageView in '..\..\Source\Model\Google.Model.Analytics.PageView.pas',
  Google.Model.Analytics.ScreenView in '..\..\Source\Model\Google.Model.Analytics.ScreenView.pas',
  Google.Model.Analytics.Session in '..\..\Source\Model\Google.Model.Analytics.Session.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
