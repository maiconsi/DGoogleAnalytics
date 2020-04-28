unit Google.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    LabelAnalytics: TLabel;
    BtnSendEvent: TButton;
    BtnSendPageView: TButton;
    Button1: TButton;
    procedure BtnSendEventClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSendPageViewClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  GoogleAnalyticsGlobal;

{$R *.dfm}

procedure TfrmPrincipal.BtnSendEventClick(Sender: TObject);
begin
  _GoogleAnalytics
    .Event('Relatorio',
            'Imprimir',
            'Vendas do dia',
            123); //Ex. Algum valor relavante ou não informe nada.

  ShowMessage('Imprimir relatório de vendas do dia.');
end;

procedure TfrmPrincipal.BtnSendPageViewClick(Sender: TObject);
begin
  _GoogleAnalytics
    .PageView('ERP',
              'frmCadastroCliente',
              'Cadastro de clientes');

  ShowMessage('Abrir formulário de cadastro de clientes.');
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  _GoogleAnalytics
    .Event('Avisos',
            'Alerta',
            'Valor do desconto excedido!');

  ShowMessage('Alerta para o usuário.');
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  _GoogleAnalytics
    .Exception('Erro ao tentar tentar localizar o cliente', False);

  ShowMessage('Erro ao tentar tentar localizar o cliente');
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  _GoogleAnalytics.EndSession;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  _GoogleAnalytics.StartSession;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  _GoogleAnalytics
    .PageView('ERP',
              'frmPrincipal',
              'Formulário principal');
end;

end.
