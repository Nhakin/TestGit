object TestGitMainFrm: TTestGitMainFrm
  Left = 0
  Top = 0
  Caption = 'Test Git 1.0.0.8'
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
  object Label1: TLabel
    Left = 28
    Top = 154
    Width = 30
    Height = 13
    Caption = 'Speed'
  end
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
    TabOrder = 8
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
  object GbSaySomething: TGroupBox
    Left = 0
    Top = 176
    Width = 300
    Height = 47
    Caption = ' Say something'
    TabOrder = 4
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
    Left = 64
    Top = 128
    Width = 150
    Height = 17
    Smooth = True
    TabOrder = 6
  end
  object CmdPBarGo: TButton
    Left = 220
    Top = 122
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
    TabOrder = 9
    OnClick = chkIsCheckedClick
  end
  object TbPBarSpeed: TTrackBar
    Left = 64
    Top = 151
    Width = 150
    Height = 19
    Max = 1000
    Min = 250
    Position = 250
    TabOrder = 10
    OnChange = TbPBarSpeedChange
  end
  object MainMenu: TMainMenu
    Left = 11
    Top = 6
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
  object Timer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerTimer
    Left = 45
    Top = 6
  end
end
