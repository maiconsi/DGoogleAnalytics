unit Google.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Google.Controller.Analytics.Interfaces;

type
  TfrmPrincipal = class(TForm)
    PanelParams: TPanel;
    Label_TID: TLabel;
    Label_CID: TLabel;
    LabelType: TLabel;
    Edit_TID: TEdit;
    Edit_UID: TEdit;
    LabelAnalytics: TLabel;
    BtnSendEvent: TButton;
    BtnSendPageView: TButton;
    BtnSendStartSession: TButton;
    BtnSendEndSession: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit_TIDExit(Sender: TObject);
    procedure Edit_UIDExit(Sender: TObject);
    procedure BtnSendStartSessionClick(Sender: TObject);
    procedure BtnSendPageViewClick(Sender: TObject);
    procedure BtnSendEndSessionClick(Sender: TObject);
    procedure BtnSendEventClick(Sender: TObject);
  private
    { Private declarations }
    FController: iControllerGoogleAnalytics;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Google.Controller.Analytics;

{$R *.dfm}

procedure TfrmPrincipal.BtnSendStartSessionClick(Sender: TObject);
begin
  FController.StartSession;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  //O Exception só funciona em app mobile
  FController
    .Exception('Erro ao abrir o relatório', false);
end;

procedure TfrmPrincipal.BtnSendEndSessionClick(Sender: TObject);
begin
  FController.EndSession;
end;

procedure TfrmPrincipal.BtnSendEventClick(Sender: TObject);
begin
  FController
    .Event('Menu',
            'Acesso',
            'Clientes',
            '');
end;

procedure TfrmPrincipal.BtnSendPageViewClick(Sender: TObject);
begin
  FController
    .PageView('ERP',
              'frmCadCliente',
              'Cadastro de Clientes');
end;

procedure TfrmPrincipal.Edit_TIDExit(Sender: TObject);
begin
  FController.GooglePropertyID(Edit_TID.Text);
end;

procedure TfrmPrincipal.Edit_UIDExit(Sender: TObject);
begin
  FController.UserID(Edit_UID.Text);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  FController  :=  TControllerGoogleAnalytics
    .New(Edit_TID.Text, Edit_UID.Text);

  FController.AppInfo
    .AppName('Meu Sistema')
    .AppVersion('2.10.2.56')
    .AppLicense('Comercial')
    .AppEdition('ERP')
    .AppID('')
    .AppInstalerID('');
end;

end.
