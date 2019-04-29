object TestGitMainFrm: TTestGitMainFrm
  Left = 0
  Top = 0
  Caption = 'Test Git 1.0.0.8'
  ClientHeight = 375
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SBar: TStatusBar
    Left = 0
    Top = 356
    Width = 558
    Height = 19
    Panels = <
      item
        Text = 'Coded By Nhakin'
        Width = 50
      end>
  end
  object pcMain: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 552
    Height = 350
    ActivePage = tsDemo
    Align = alClient
    TabOrder = 0
    object tsDemo: TTabSheet
      Caption = 'Demo'
      ExplicitLeft = 0
      ExplicitTop = 25
      object Label1: TLabel
        Left = 9
        Top = 161
        Width = 30
        Height = 13
        Caption = 'Speed'
      end
      object RgOptions: TRadioGroup
        Left = 10
        Top = 19
        Width = 189
        Height = 109
        Caption = ' Options '
        Items.Strings = (
          'Option #1'
          'Option #2'
          'Option #3'
          'Option #4')
        TabOrder = 0
      end
      object CmdOk: TButton
        Left = 119
        Top = 98
        Width = 75
        Height = 25
        Caption = 'Ok'
        TabOrder = 1
        OnClick = CmdOkClick
      end
      object GbSaySomething: TGroupBox
        Left = 5
        Top = 183
        Width = 300
        Height = 47
        Caption = ' Say something'
        TabOrder = 5
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
        Left = 10
        Top = 135
        Width = 150
        Height = 17
        Smooth = True
        TabOrder = 3
      end
      object CmdPBarGo: TButton
        Left = 166
        Top = 129
        Width = 75
        Height = 25
        Caption = 'Go'
        TabOrder = 2
        OnClick = CmdPBarGoClick
      end
      object chkIsChecked: TCheckBox
        Left = 14
        Top = 236
        Width = 97
        Height = 17
        Caption = 'Is Checked?'
        TabOrder = 6
        OnClick = chkIsCheckedClick
      end
      object TbPBarSpeed: TTrackBar
        Left = 45
        Top = 158
        Width = 150
        Height = 19
        Max = 1000
        Min = 250
        Position = 250
        TabOrder = 4
        OnChange = TbPBarSpeedChange
      end
    end
    object tsTreeView: TTabSheet
      Caption = 'TreeView Demo'
      ImageIndex = 1
      object Splitter: TSplitter
        Left = 195
        Top = 0
        Height = 322
        ExplicitLeft = 220
        ExplicitTop = 128
        ExplicitHeight = 100
      end
      object vstDemo: TVirtualStringTree
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 189
        Height = 316
        Align = alLeft
        Header.AutoSizeIndex = 0
        Header.DefaultHeight = 17
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        Header.MainColumn = -1
        TabOrder = 0
        OnGetText = vstDemoGetText
        OnInitChildren = vstDemoInitChildren
        OnInitNode = vstDemoInitNode
        Columns = <>
      end
      object PanTvDemo: TPanel
        AlignWithMargins = True
        Left = 201
        Top = 3
        Width = 340
        Height = 316
        Align = alClient
        TabOrder = 1
      end
    end
    object tsSynEditDemo: TTabSheet
      Caption = 'Syn Edit Demo'
      ImageIndex = 2
      object MemoSrc: TSynMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 538
        Height = 316
        Align = alClient
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.ShowLineNumbers = True
        Gutter.ShowModification = True
        Highlighter = SynPasSyn1
        Lines.UnicodeStrings = 
          '{This is a Comment}'#13#10#13#10'procedure TTestGitMainFrm.CmdOkClick(Send' +
          'er: TObject);'#13#10'begin'#13#10'  lChar := #$29A;'#13#10#13#10'  If RgOptions.ItemIn' +
          'dex > -1 Then'#13#10'    ShowMessage(RgOptions.Items[RgOptions.ItemInd' +
          'ex])'#13#10'  Else'#13#10'    ShowMessage('#39'Please select an option.'#39');'#13#10'end;'
        FontSmoothing = fsmNone
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 11
    Top = 37
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
    Top = 37
  end
  object SynPasSyn1: TSynPasSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    AsmAttri.Background = clBlack
    AsmAttri.Foreground = clLime
    CommentAttri.Background = clBlack
    CommentAttri.Foreground = clYellow
    IdentifierAttri.Background = clBlack
    IdentifierAttri.Foreground = clWhite
    KeyAttri.Background = clBlack
    KeyAttri.Foreground = clAqua
    NumberAttri.Background = clBlack
    NumberAttri.Foreground = clFuchsia
    StringAttri.Background = clBlack
    StringAttri.Foreground = clRed
    CharAttri.Background = clBlack
    CharAttri.Foreground = clRed
    SymbolAttri.Background = clBlack
    SymbolAttri.Foreground = clWhite
    Left = 370
    Top = 65
  end
end
