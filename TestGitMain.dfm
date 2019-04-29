object TestGitMainFrm: TTestGitMainFrm
  Left = 0
  Top = 0
  Caption = 'Test Git 1.0.0.5'
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
  object MainMenu: TMainMenu
    Left = 6
    Top = 4
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
    object mnuVersion: TMenuItem
      Caption = 'Version'
      object mnuLive: TMenuItem
        Caption = 'Live'
        OnClick = CmdLiveClick
      end
      object mnuBeta: TMenuItem
        Caption = 'Beta'
        OnClick = CmdBetaClick
      end
      object mnuDev: TMenuItem
        Caption = 'Dev'
        OnClick = CmdDevClick
      end
    end
  end
end
