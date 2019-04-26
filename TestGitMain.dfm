object TestGitMainFrm: TTestGitMainFrm
  Left = 0
  Top = 0
  Caption = 'Test Git 1.0.0.7'
  ClientHeight = 170
  ClientWidth = 328
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
    Top = 151
    Width = 328
    Height = 19
    Panels = <
      item
        Text = 'Coded By Nhakin'
        Width = 50
      end>
    ExplicitTop = 222
    ExplicitWidth = 366
  end
  object RgOptions: TRadioGroup
    Left = 111
    Top = 12
    Width = 189
    Height = 109
    Caption = ' Options '
    Items.Strings = (
      'Option #1'
      'Option #2'
      'Option #3'
      'Option #4')
    TabOrder = 4
  end
  object CmdOk: TButton
    Left = 220
    Top = 91
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 5
    OnClick = CmdOkClick
  end
  object MainMenu: TMainMenu
    Left = 9
    Top = 103
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
