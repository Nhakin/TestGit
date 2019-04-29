object TestGitMainFrm: TTestGitMainFrm
  Left = 0
  Top = 0
  Caption = 'Test Git 1.0.0.7'
  ClientHeight = 270
  ClientWidth = 314
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
    Top = 251
    Width = 314
    Height = 19
    Panels = <
      item
        Text = 'Coded By Nhakin'
        Width = 50
      end>
  end
  object RgOptions: TRadioGroup
    Left = 8
    Top = 8
    Width = 189
    Height = 109
    Caption = ' Options '
    Items.Strings = (
      'Option #1'
      'Option #2'
      'Option #3'
      'Option #4')
    TabOrder = 1
  end
  object CmdOk: TButton
    Left = 117
    Top = 87
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 3
    OnClick = CmdOkClick
  end
  object GbSaySomething: TGroupBox
    Left = 0
    Top = 176
    Width = 300
    Height = 47
    Caption = ' Say something'
    TabOrder = 2
    object EditSaySomething: TEdit
      Left = 9
      Top = 17
      Width = 205
      Height = 21
      TabOrder = 0
    end
    object CmdSaySomething: TButton
      Left = 220
      Top = 15
      Width = 62
      Height = 25
      Caption = 'Ok'
      TabOrder = 1
      OnClick = CmdSaySomethingClick
    end
  end
  object PBar: TProgressBar
    Left = 8
    Top = 127
    Width = 150
    Height = 17
    Smooth = True
    TabOrder = 5
  end
  object CmdPBarGo: TButton
    Left = 164
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Go'
    TabOrder = 7
    OnClick = CmdPBarGoClick
  end
  object chkIsChecked: TCheckBox
    Left = 9
    Top = 229
    Width = 97
    Height = 17
    Caption = 'Is Checked?'
    TabOrder = 4
    OnClick = chkIsCheckedClick
  end
  object TbPBarSpeed: TTrackBar
    Left = 8
    Top = 150
    Width = 150
    Height = 19
    Max = 1000
    Min = 250
    Position = 250
    TabOrder = 6
    OnChange = TbPBarSpeedChange
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
  object Timer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerTimer
    Left = 45
    Top = 6
  end
end
