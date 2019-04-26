object TestGitMainFrm: TTestGitMainFrm
  Left = 0
  Top = 0
  Caption = 'Test Git 1.0.0.6'
  ClientHeight = 241
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CmdLive: TButton
    Left = 8
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Live'
    TabOrder = 0
    OnClick = CmdLiveClick
  end
  object CmdBeta: TButton
    Left = 8
    Top = 43
    Width = 75
    Height = 25
    Caption = 'Beta'
    TabOrder = 1
    OnClick = CmdBetaClick
  end
  object CmdDev: TButton
    Left = 8
    Top = 74
    Width = 75
    Height = 25
    Caption = 'Dev'
    TabOrder = 2
    OnClick = CmdDevClick
  end
  object SBar: TStatusBar
    Left = 0
    Top = 222
    Width = 366
    Height = 19
    Panels = <
      item
        Text = 'Coded By Nhakin'
        Width = 50
      end>
  end
  object GbSaySomething: TGroupBox
    Left = 8
    Top = 169
    Width = 350
    Height = 47
    Caption = ' Say something'
    TabOrder = 4
    object EditSaySomething: TEdit
      Left = 9
      Top = 17
      Width = 266
      Height = 21
      TabOrder = 0
    end
    object CmdSaySomething: TButton
      Left = 281
      Top = 15
      Width = 62
      Height = 25
      Caption = 'Ok'
      TabOrder = 1
      OnClick = CmdSaySomethingClick
    end
  end
  object MainMenu: TMainMenu
    Left = 105
    Top = 7
    object mnuFile: TMenuItem
      Caption = 'File'
      object mnuAbout: TMenuItem
        Caption = 'About'
        OnClick = mnuAboutClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuExit: TMenuItem
        Caption = 'Exit'
        OnClick = mnuExitClick
      end
    end
  end
end
