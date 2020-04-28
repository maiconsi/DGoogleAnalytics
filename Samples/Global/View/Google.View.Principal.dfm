object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Google Analytics'
  ClientHeight = 133
  ClientWidth = 221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelAnalytics: TLabel
    Left = 8
    Top = 8
    Width = 200
    Height = 13
    Caption = 'https://www.google-analytics.com/collect'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BtnSendEvent: TButton
    Left = 8
    Top = 66
    Width = 200
    Height = 25
    Caption = 'Event - Relat'#243'rio vendas do dia'
    TabOrder = 0
    OnClick = BtnSendEventClick
  end
  object BtnSendPageView: TButton
    Left = 8
    Top = 27
    Width = 200
    Height = 25
    Caption = 'PageView - Cadastro Cliente'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BtnSendPageViewClick
  end
  object Button1: TButton
    Left = 8
    Top = 97
    Width = 200
    Height = 25
    Caption = 'Event - Alerta para o usu'#225'rio'
    TabOrder = 2
    OnClick = Button1Click
  end
end
