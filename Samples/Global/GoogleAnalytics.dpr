program GoogleAnalytics;

uses
  Vcl.Forms,
  Google.View.Principal in 'View\Google.View.Principal.pas' {frmPrincipal},
  Google.Controller.Analytics.Interfaces in 'Controller\Google.Controller.Analytics.Interfaces.pas',
  Google.Model.Analytics.Interfaces in 'Model\Google.Model.Analytics.Interfaces.pas',
  Google.Controller.Analytics in 'Controller\Google.Controller.Analytics.pas',
  Google.Model.Analytics.ScreenView in 'Model\Google.Model.Analytics.ScreenView.pas',
  Google.Model.Analytics.Factory.Interfaces in 'Model\Google.Model.Analytics.Factory.Interfaces.pas',
  Google.Model.Analytics.Factory in 'Model\Google.Model.Analytics.Factory.pas',
  Google.Model.Analytics.AppInfo in 'Model\Google.Model.Analytics.AppInfo.pas',
  Google.Model.Analytics.PageView in 'Model\Google.Model.Analytics.PageView.pas',
  Google.Model.Analytics.Session in 'Model\Google.Model.Analytics.Session.pas',
  Google.Model.Analytics.Event in 'Model\Google.Model.Analytics.Event.pas',
  Google.Model.Analytics.Exception in 'Model\Google.Model.Analytics.Exception.pas',
  Google.Model.Analytics.Invoker in 'Model\Google.Model.Analytics.Invoker.pas',
  GoogleAnalyticsGlobal in 'GoogleAnalyticsGlobal.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
