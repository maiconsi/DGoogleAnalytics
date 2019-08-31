object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Google Analytics'
  ClientHeight = 157
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
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
  object PanelParams: TPanel
    Left = 8
    Top = 27
    Width = 213
    Height = 86
    TabOrder = 0
    object Label_TID: TLabel
      Left = 15
      Top = 30
      Width = 53
      Height = 13
      Caption = 'Param_TID'
    end
    object Label_CID: TLabel
      Left = 14
      Top = 59
      Width = 54
      Height = 13
      Caption = 'Param_UID'
    end
    object LabelType: TLabel
      Left = 15
      Top = 8
      Width = 98
      Height = 13
      Caption = 'Informa'#231#245'es B'#225'sicas'
    end
    object Edit_TID: TEdit
      Left = 74
      Top = 27
      Width = 126
      Height = 21
      Hint = 'Tracking ID'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = 'Tracking ID'
      OnExit = Edit_TIDExit
    end
    object Edit_UID: TEdit
      Left = 74
      Top = 54
      Width = 126
      Height = 21
      Hint = 'User ID'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TextHint = 'User ID'
      OnExit = Edit_UIDExit
    end
  end
  object BtnSendEvent: TButton
    Left = 146
    Top = 119
    Width = 75
    Height = 25
    Caption = 'Event'
    TabOrder = 1
    OnClick = BtnSendEventClick
  end
  object BtnSendPageView: TButton
    Left = 8
    Top = 119
    Width = 75
    Height = 25
    Caption = 'PageView'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BtnSendPageViewClick
  end
  object BtnSendStartSession: TButton
    Left = 227
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Start Session'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BtnSendStartSessionClick
  end
  object BtnSendEndSession: TButton
    Left = 227
    Top = 61
    Width = 75
    Height = 25
    Hint = 'Send Information to Google Analytics'
    Caption = 'End Session'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = BtnSendEndSessionClick
  end
end
