object TestGitMainFrm: TTestGitMainFrm
  Left = 0
  Top = 0
  Caption = 'Test Git 1.0.0.10'
  ClientHeight = 400
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object tcMain: TSpTBXTabControl
    AlignWithMargins = True
    Left = 3
    Top = 28
    Width = 550
    Height = 344
    Align = alClient
    ActiveTabIndex = 1
    HiddenItems = <>
    object SpTBXTabItem3: TSpTBXTabItem
      Caption = 'Demo'
    end
    object SpTBXTabItem2: TSpTBXTabItem
      Caption = 'TreeView Demo'
      Checked = True
    end
    object SpTBXTabItem1: TSpTBXTabItem
      Caption = 'SynEdit Demo'
    end
    object sptbxSynEditDemo: TSpTBXTabSheet
      Left = 0
      Top = 25
      Width = 550
      Height = 319
      Caption = 'SynEdit Demo'
      ImageIndex = -1
      TabItem = 'SpTBXTabItem1'
      object MemoSrc: TSynMemo
        AlignWithMargins = True
        Left = 5
        Top = 3
        Width = 538
        Height = 309
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
    object sptbxDemo: TSpTBXTabSheet
      Left = 0
      Top = 25
      Width = 550
      Height = 319
      Caption = 'Demo'
      ImageIndex = -1
      TabItem = 'SpTBXTabItem3'
      object RgOptions: TSpTBXRadioGroup
        Left = 10
        Top = 19
        Width = 189
        Height = 109
        Caption = ' Options '
        TabOrder = 0
        Items.Strings = (
          'Option #1'
          'Option #2'
          'Option #3'
          'Option #4')
      end
      object CmdOk: TSpTBXButton
        Left = 119
        Top = 98
        Width = 75
        Height = 25
        Caption = 'Ok'
        TabOrder = 1
        OnClick = CmdOkClick
      end
      object CmdPBarGo: TSpTBXButton
        Left = 166
        Top = 129
        Width = 75
        Height = 25
        Caption = 'Go'
        TabOrder = 3
        OnClick = CmdPBarGoClick
      end
      object PBar: TSpTBXProgressBar
        Left = 10
        Top = 135
        Width = 150
        Height = 17
        Caption = '0%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Smooth = True
      end
      object chkIsChecked: TSpTBXCheckBox
        Left = 14
        Top = 236
        Width = 82
        Height = 21
        Caption = 'Is Checked?'
        TabOrder = 4
        OnClick = chkIsCheckedClick
      end
      object TbPBarSpeed: TSpTBXTrackBar
        Left = 45
        Top = 158
        Width = 150
        Height = 26
        Max = 1000
        Min = 250
        Position = 250
        TabOrder = 5
        OnChange = TbPBarSpeedChange
      end
      object Label1: TSpTBXLabel
        Left = 9
        Top = 161
        Width = 36
        Height = 19
        Caption = 'Speed'
      end
      object GbSaySomething: TSpTBXGroupBox
        Left = 5
        Top = 183
        Width = 300
        Height = 47
        Caption = ' Say something'
        TabOrder = 2
        object CmdSaySomething: TSpTBXButton
          Left = 220
          Top = 15
          Width = 62
          Height = 25
          Caption = 'Ok'
          TabOrder = 1
          OnClick = CmdSaySomethingClick
        end
        object EditSaySomething: TSpTBXEdit
          Left = 9
          Top = 17
          Width = 205
          Height = 21
          TabOrder = 0
        end
      end
    end
    object sptbxTreeViewDemo: TSpTBXTabSheet
      Left = 0
      Top = 25
      Width = 550
      Height = 319
      Caption = 'TreeView Demo'
      ImageIndex = -1
      TabItem = 'SpTBXTabItem2'
      object Splitter: TSplitter
        Left = 187
        Top = 0
        Height = 315
        ExplicitLeft = 236
        ExplicitTop = 15
        ExplicitHeight = 321
      end
      object PanTv: TPanel
        Left = 2
        Top = 0
        Width = 185
        Height = 315
        Align = alLeft
        TabOrder = 0
        object vstDemo: TSpTBXVirtualStringTree
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 177
          Height = 307
          Align = alClient
          Header.AutoSizeIndex = 1
          Header.DefaultHeight = 17
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoOwnerDraw, hoShowSortGlyphs, hoVisible]
          Images = ilTreeView
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoDeleteMovedNodes]
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toEditable, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning]
          TreeOptions.PaintOptions = [toHotTrack, toPopupMode, toShowButtons, toShowDropmark, toShowRoot, toShowTreeLines, toThemeAware, toUseBlendedImages]
          TreeOptions.SelectionOptions = [toExtendedFocus]
          OnCompareNodes = vstDemoCompareNodes
          OnFocusChanged = vstDemoFocusChanged
          OnGetText = vstDemoGetText
          OnGetImageIndex = vstDemoGetImageIndex
          OnHeaderClick = vstDemoHeaderClick
          OnInitChildren = vstDemoInitChildren
          OnInitNode = vstDemoInitNode
          OnNewText = vstDemoNewText
          Columns = <
            item
              Position = 0
              Width = 95
              WideText = 'Name'
            end
            item
              Position = 1
              Width = 78
              WideText = 'Value'
            end>
        end
      end
      object PanTvDemo: TPanel
        AlignWithMargins = True
        Left = 193
        Top = 3
        Width = 350
        Height = 309
        Align = alClient
        TabOrder = 1
        object EditTvValueValue: TSpTBXEdit
          Left = 59
          Top = 39
          Width = 149
          Height = 21
          TabOrder = 0
          OnChange = EditTvValueNameChange
        end
        object EditTvValueName: TSpTBXEdit
          Left = 59
          Top = 12
          Width = 149
          Height = 21
          TabOrder = 1
          OnChange = EditTvValueNameChange
        end
        object Label2: TSpTBXLabel
          Left = 11
          Top = 16
          Width = 33
          Height = 19
          Caption = 'Name'
        end
        object Label3: TSpTBXLabel
          Left = 11
          Top = 43
          Width = 32
          Height = 19
          Caption = 'Value'
        end
      end
    end
  end
  object SpTBXDock1: TSpTBXDock
    Left = 0
    Top = 0
    Width = 556
    Height = 25
    AllowDrag = False
    object SpTBXToolbar1: TSpTBXToolbar
      Left = 0
      Top = 0
      CloseButton = False
      FullSize = True
      LinkSubitems = SpTBXTBGroupItem1
      ProcessShortCuts = True
      ShrinkMode = tbsmWrap
      TabOrder = 0
      Caption = 'sptbxMenu'
      Customizable = False
      MenuBar = True
    end
  end
  object SpTBXStatusBar1: TSpTBXStatusBar
    Left = 0
    Top = 375
    Width = 556
    Height = 25
    object SpTBXLabelItem1: TSpTBXLabelItem
      Caption = 'Coded By Nhakin'
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
    Left = 10
    Top = 68
  end
  object ilTreeView: TImageList
    Left = 44
    Top = 69
    Bitmap = {
      494C010104007800380010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000A57B73000884180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500F7CE9C00F7CE9400F7CE
      9C00F7CE9C00F7D69C00B5848400000000000000000000000000000000000000
      0000A57B730008841800088418009C6B6B000000000000000000000000000000
      00000000000000000000000000000000000000000000B5848400A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B73009C6B63000000000000000000000000000000000000000000009C
      CE004AB5E70063C6EF0052BDE70039B5DE004ABDE70000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      DE00F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6A500EFCE9C00EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000000000000000
      0000A57B73000884180021B5390008841800A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B73008C5A5A0000000000B5848400FFEFDE00F7E7
      CE00F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400F7D69C009C6B63000000000000000000000000000000000008A5CE0008A5
      D6007BD6F700A5DEFF0094DEFF0094DEFF007BCEEF0073CEEF004AB5E7000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFF7
      E700FFE7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6A500EFCE
      9C00EFCE9400F7D69C00B5848400000000000884180008841800088418000884
      1800088418000884180029BD4A0021B5390008841800FFDEB500FFD6AD00FFD6
      A500FFD6A500FFD6A500FFD6A5008C5A5A0000000000B5847300FFF7E700FFE7
      D600F7E7CE00F7DEC60010529400105294001052940010529400C6B59C00EFCE
      9400F7D69C009C6B63000000000000000000000000000000000010ADD60018AD
      DE0084DEEF00A5E7FF0094DEFF0084D6F7005ABDE7008CD6F7009CDEFF0073CE
      F700000000000000000000000000000000000000000000000000CEADA500FFF7
      EF00FFEFDE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6
      A500EFCE9C00F7D69C00B5848400000000000884180063EF94005AE78C0052DE
      84004AD6730042CE630039C65A0029BD4A0021B5390008841800FFDEB500FFD6
      AD00FFD6A500FFD6A500FFD6A5008C5A5A0000000000B5847300FFF7EF00FFEF
      DE00F7E7D600F7E7CE00F7DEC600C6C6B50010529400188CEF0010529400C6B5
      9C00F7D69C009C6B63000000000000000000000000000000000021ADDE0029B5
      DE0094DEEF00B5EFFF00A5E7FF0063B5D600319CC6006BC6EF0094DEFF009CDE
      FF0031B5DE000000000000000000000000000000000000000000CEB5AD00FFFF
      F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6
      AD00F7D6A500F7D69C00B5848400000000000884180063EF940063EF94005AE7
      8C0052DE84004AD6730042CE630031C65A0029BD4A0021B5390008841800B584
      7300B5847300B5847300FFD6A5008C5A5A0000000000BD8C8400FFFFF700FFEF
      E700FFEFDE00F7E7D600F7E7CE00F7DEC600C6C6B500105294002994EF001052
      9400C6BD9C009C6B63000000000000000000000000000000000029B5DE0039BD
      E700B5E7F700CEFFFF00B5F7FF0084CEDE00297BA5006BBDE70094DEFF0094DE
      FF0031B5DE000000000000000000000000000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700FFEFDE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6
      B500F7D6AD00F7D6A500B5848400000000000884180063EF940063EF940063EF
      94005AE78C0052DE84004AD6730042CE630031C6520008841800FFEFD600FFE7
      C600FFDEB500FFD6AD00FFD6AD008C5A5A0000000000BD8C8400FFFFFF00CED6
      DE0010529400CECECE00F7E7D600105294001052940052ADF70042A5F700319C
      F70010529400105294000000000000000000000000000000000039BDE7004AC6
      EF00C6EFF700EFFFFF00CEF7FF00B5EFF70063ADBD008CCEEF009CDEFF0094DE
      FF0031B5DE000000000000000000000000000000000000000000D6BDB500FFFF
      FF00FFFFF700FFF7EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7DEC600F7DE
      BD00F7DEB500F7DEAD00B5848400000000000884180008841800088418000884
      1800088418000884180052DE84004AD6730008841800B5847300B5847300B584
      7300B5847300B5847300FFDEB5008C5A5A0000000000CE9C8400CEDEEF001052
      9400188CEF0010529400CECECE00CECEC600105294005AB5F7005AB5F70052AD
      F700105294007B636B000000000000000000000000000000000029B5DE0042C6
      E7005AC6DE006BCEE70063CEE70063C6E7006BCEE70084DEEF009CE7FF00A5E7
      FF0031B5DE000000000000000000000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFF700FFF7EF00FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEBD00FFDEB500B5848400000000000000000000000000BD8C7300DEDE
      EF00C6948400088418005AE78C0008841800FFF7EF00FFF7EF00FFF7E700FFEF
      D600FFE7CE00FFDEBD00FFDEBD008C5A5A0000000000CE9C8400105294005AB5
      F700399CF700188CEF0010529400FFEFDE00CECEC600105294005AB5F7001052
      9400CEC6AD009C6B63000000000000000000000000000000000029B5DE005ACE
      E70042BDD60042BDDE0042C6DE0031B5DE004AC6E7006BCEEF009CE7FF0084D6
      F70021ADD6000000000000000000000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFEFE700FFEFDE00FFE7D600F7E7
      CE00F7E7C600F7DEB500B58484000000000000000000D69C7B00EFD6C600FFFF
      FF00CE9C84000884180008841800FFFFF700B5847300B5847300B5847300B584
      7300AD7B7300B5847300FFDEC6008C5A5A000000000010529400105294005AB5
      F7005AB5F700399CF7001052940010529400FFEFDE00CECEC60010529400CEC6
      BD00F7DEB5009C6B63000000000000000000000000000000000029B5D6005ACE
      DE00089CC60039B5D6008CF7FF0052D6EF0021B5DE00009CCE0021ADD60052C6
      E70018A5D6000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFEFE700FFEFDE00FFEF
      DE00E7DEC600C6BDAD00B58484000000000000000000D69C7B00FFEFE700FFFF
      FF00D6A5840008841800FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFEF
      DE00FFEFD600FFEFD600EFD6BD00845A5A0000000000DEAD8400CEDEEF001052
      94005AB5F70010529400CEDEE700FFF7EF00FFEFE700FFEFDE00FFEFDE00E7DE
      C600C6BDAD009C6B630000000000000000000000000000000000000000000894
      C6000094BD0029ADCE0084F7FF007BEFFF0042C6DE000894C600109CC60018AD
      D600000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B58484000000000000000000EFBD9400FFFFFF00FFFF
      FF00DEAD8C00FFFFF700FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00FFF7
      E700FFEFDE00CEBDAD00D6C6AD008452520000000000E7B58C00FFFFFF00CEDE
      EF00105294005AB5F70010529400CED6E700FFF7EF00F7E7D600B5847300B584
      7300B5847300B584730000000000000000000000000000000000000000000000
      0000089CC600189CC6000000000039BDE70021A5CE000894C6000894C6000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7CECE00BD8C
      7300EFB57300EFA54A00C6846B000000000000000000EFBD9400FFFFFF00FFFF
      FF00DEB58C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFFF
      FF00B5847300B5847300B5847300B57B730000000000E7B58C00FFFFFF00FFFF
      FF00CEDEEF0010529400105294001052940010529400E7CECE00B5847300EFB5
      7300EFA54A00C6846B0000000000000000000000000000000000000000000000
      00004AC6E700299CC6000000000000000000000000000894BD00088CB5000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6D600CE9C
      7B00FFC67300CE9473000000000000000000EFBD9400EFBD9400F7DECE00FFF7
      EF00E7B58C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BD8C7B00FFE7AD00FFE7AD00CE9C840000000000EFBD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6D600B5847300FFC6
      7300CE9473000000000000000000000000000000000000000000000000000000
      000039A5C60073DEEF0039ADCE0000000000108CB500089CCE00000000000000
      0000000000000000000000000000000000000000000000000000EFCEB500FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700E7D6CE00C694
      7B00CE9C84000000000000000000000000000000000000000000D69C7B00DEA5
      7B00E7B58C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700BD8C7B00FFE7AD00CE9C84000000000000000000EFBD9400FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700E7D6CE00B5847300CE9C
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000004AB5CE007BE7EF006BD6E7004ABDE700189CC600000000000000
      0000000000000000000000000000000000000000000000000000EFC6B500EFCE
      BD00EFCEBD00EFCEBD00EFCEBD00EFCEBD00EFCEBD00EFCEBD00DEBDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000EFBD9400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD
      8400BD8C7B00CE9C8400000000000000000000000000EFBD9400DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400B58473000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C001F3FFFFFFFFFFC001F0FF8003E07F
      C001F0008003C01FC00100008003C00FC00100008003C007C00100008003C007
      C00100008003C007C00100008003C007C001C0008003C007C00180008003C007
      C00180008003E00FC00180008003F21FC00180008003F39FC00300008007F13F
      C007C001800FF83FC00FF003801FFFFF00000000000000000000000000000000
      000000000000}
  end
  object SpTBXBItemContainer1: TSpTBXBItemContainer
    Left = 12
    Top = 35
    object SpTBXTBGroupItem1: TSpTBXTBGroupItem
      object mnuFile: TTBSubmenuItem
        Caption = 'File'
        object N1: TTBSeparatorItem
        end
        object mnuAbout: TSpTBXItem
          Caption = 'About'
          OnClick = mnuAboutClick
        end
        object mnuExit: TSpTBXItem
          Caption = 'Exit'
          OnClick = mnuExitClick
        end
      end
      object mnuVersion: TTBSubmenuItem
        Caption = 'Version'
        object mnuLive: TSpTBXItem
          Caption = 'Live'
          OnClick = CmdLiveClick
        end
        object mnuBeta: TSpTBXItem
          Caption = 'Beta'
          OnClick = CmdBetaClick
        end
        object mnuDev: TSpTBXItem
          Caption = 'Dev'
          OnClick = CmdDevClick
        end
      end
      object SpTBXSubmenuItem1: TSpTBXSubmenuItem
        Caption = 'Skins'
        object SpTBXSkinGroupItem1: TSpTBXSkinGroupItem
        end
      end
    end
  end
end
