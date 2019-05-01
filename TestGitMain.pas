Unit TestGitMain;

Interface

Uses
  ClsAppConfig,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, ExtCtrls, SynEditHighlighter,
  SynHighlighterPas, SynEdit, SynMemo, VirtualTrees, ImgList, TB2Item,
  SpTBXItem, SpTBXTabs, TB2Dock, TB2Toolbar, SpTBXControls, SpTBXEditors,
  SpTBXExControls, SpTBXDkPanels;

Type
  ITreeViewDatas = Interface;
  
  ITreeViewData = Interface(IInterface)
    ['{4B61686E-29A0-2112-ABA4-5433658EFC37}']
    Function  GetDataName() : String;
    Procedure SetDataName(Const ADataName : String);

    Function  GetDataValue() : String;
    Procedure SetDataValue(Const ADataValue : String);

    Function  GetExpanded() : Boolean;
    Procedure SetExpanded(Const AExpanded : Boolean);

    Function  GetIsSelected() : Boolean;
    Procedure SetIsSelected(Const AIsSelected : Boolean);

    Function GetItems() : ITreeViewDatas;

    Property DataName   : String        Read GetDataName   Write SetDataName;
    Property DataValue  : String        Read GetDataValue  Write SetDataValue;
    Property Expanded   : Boolean       Read GetExpanded   Write SetExpanded;
    Property IsSelected : Boolean       Read GetIsSelected Write SetIsSelected;
    Property Items     : ITreeViewDatas Read GetItems;

  End;

  ITreeViewDatas = Interface(IInterfaceList)
    ['{4B61686E-29A0-2112-B570-7FBE95FE32F6}']
    Function  Get(Index : Integer) : ITreeViewData;
    Procedure Put(Index : Integer; Const Item : ITreeViewData);

    Function  GetAsXml() : String;
    Procedure SetAsXml(AXmlString : String);

    Function Add() : ITreeViewData; OverLoad;
    Function Add(Const AItem : ITreeViewData) : Integer; OverLoad;

    Property Items[Index : Integer] : ITreeViewData Read Get Write Put; Default;
    Property AsXml : String Read GetAsXml Write SetAsXml;

  End;

  TTestGitMainFrm = Class(TForm)
    chkIsChecked: TSpTBXCheckBox;
    CmdOk: TSpTBXButton;
    CmdPBarGo: TSpTBXButton;
    CmdSaySomething: TSpTBXButton;
    EditSaySomething: TSpTBXEdit;
    EditTvValueName: TSpTBXEdit;
    EditTvValueValue: TSpTBXEdit;
    GbSaySomething: TSpTBXGroupBox;
    ilTreeView: TImageList;
    Label1: TSpTBXLabel;
    Label2: TSpTBXLabel;
    Label3: TSpTBXLabel;
    MemoSrc: TSynMemo;
    mnuAbout: TSpTBXItem;
    mnuBeta: TSpTBXItem;
    mnuDev: TSpTBXItem;
    mnuExit: TSpTBXItem;
    mnuFile: TSpTBXSubmenuItem;
    mnuHelp: TSpTBXSubmenuItem;
    mnuLive: TSpTBXItem;
    mnuVersion: TSpTBXSubmenuItem;
    PanTv: TPanel;
    PanTvDemo: TPanel;
    PBar: TSpTBXProgressBar;
    RgOptions: TSpTBXRadioGroup;
    SpTBXBItemContainer1: TSpTBXBItemContainer;
    sptbxDemo: TSpTBXTabSheet;
    SpTBXDock1: TSpTBXDock;
    SpTBXLabelItem1: TSpTBXLabelItem;
    SpTBXSkinGroupItem1: TSpTBXSkinGroupItem;
    SpTBXStatusBar1: TSpTBXStatusBar;
    SpTBXSubmenuItem1: TSpTBXSubmenuItem;
    sptbxSynEditDemo: TSpTBXTabSheet;
    SpTBXTabItem1: TSpTBXTabItem;
    SpTBXTabItem2: TSpTBXTabItem;
    SpTBXTabItem3: TSpTBXTabItem;
    SpTBXTBGroupItem1: TSpTBXTBGroupItem;
    SpTBXTitleBar1: TSpTBXTitleBar;
    SpTBXToolbar1: TSpTBXToolbar;
    sptbxTreeViewDemo: TSpTBXTabSheet;
    SynPasSyn1: TSynPasSyn;
    TbPBarSpeed: TSpTBXTrackBar;
    tcMain: TSpTBXTabControl;
    Timer: TTimer;
    vstDemo: TSpTBXVirtualStringTree;
    Splitter: TSpTBXSplitter;

    procedure chkIsCheckedClick(Sender: TObject);
    Procedure CmdBetaClick(Sender : TObject);
    Procedure CmdDevClick(Sender : TObject);
    Procedure CmdLiveClick(Sender : TObject);
    procedure CmdOkClick(Sender: TObject);
    procedure CmdPBarGoClick(Sender: TObject);
    procedure CmdSaySomethingClick(Sender: TObject);
    procedure EditTvValueNameChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure TbPBarSpeedChange(Sender: TObject);
    procedure TimerTimer(Sender: TObject);

    //VirtualTreeView Event Handler
    procedure vstDemoInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure vstDemoGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure vstDemoInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var ChildCount: Cardinal);
    procedure vstDemoGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
      var ImageIndex: Integer);
    procedure vstDemoFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex);
    procedure vstDemoNewText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; NewText: WideString);
    procedure vstDemoCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure vstDemoHeaderClick(Sender: TVTHeader; Column: TColumnIndex;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  Private
    FAppConfig   : IXMLAppSettings;
    FTreeViewData : ITreeViewDatas;
    FPrevData     : ITreeViewData;
    
    Procedure SetNodeData(ANode : PVirtualNode; ANodeData : IInterface);
    Function  GetNodeData(ANode : PVirtualNode; AId : TGUID; Var ANodeData) : Boolean; OverLoad;
    Function  GetNodeData(ANode : PVirtualNode; AId : TGUID) : Boolean; OverLoad;

    Procedure DoUpdateTreeViewData(Sender : TBaseVirtualTree; Node : PVirtualNode; Data : Pointer; Var Abort : Boolean);

  Public
    Procedure AfterConstruction(); OverRide;

  End;

Type
  TTreeViewData = Class(TObject)
  Public
    Class Function CreateTreeViewData() : ITreeViewDatas;

  End;
Var
  TestGitMainFrm : TTestGitMainFrm;

Implementation

Uses
  TypInfo, SpTBXSkins, SpTBXDefaultSkins, SpTBXAdditionalSkins, XmlDoc, XmlIntf, AboutFrm;

{$R *.dfm}

Type
  TTreeViewDataImpl = Class(TInterfacedObject, ITreeViewData)
  Private
    FDataName   : String;
    FDataValue  : String;
    FExpanded   : Boolean;
    FIsSelected : Boolean;
    FItems      : ITreeviewDatas;

  Protected
    Function  GetDataName() : String;
    Procedure SetDataName(Const ADataName : String);

    Function  GetDataValue() : String;
    Procedure SetDataValue(Const ADataValue : String);

    Function  GetExpanded() : Boolean;
    Procedure SetExpanded(Const AExpanded : Boolean);

    Function  GetIsSelected() : Boolean;
    Procedure SetIsSelected(Const AIsSelected : Boolean);

    Function GetItems() : ITreeViewDatas;

    Procedure Clear();

  Public
    Procedure AfterConstruction(); OverRide;
    Procedure BeforeDestruction(); OverRide;

  End;

  TTreeViewDatas = Class(TInterfaceList, ITreeViewDatas)
  Protected
    Function  Get(Index : Integer) : ITreeViewData; OverLoad;
    Procedure Put(Index : Integer; Const Item : ITreeViewData); OverLoad;

    Function  GetAsXml() : String;
    Procedure SetAsXml(AXmlString : String);

    Function Add() : ITreeViewData; OverLoad;
    Function Add(Const AItem : ITreeViewData) : Integer; OverLoad;

    Property Items[Index : Integer] : ITreeViewData Read Get Write Put; Default;

  End;

Class Function TTreeViewData.CreateTreeViewData() : ITreeViewDatas;
Begin
  Result := TTreeViewDatas.Create();
End;

(******************************************************************************)

Procedure TTreeViewDataImpl.AfterConstruction();
Begin
  InHerited AfterConstruction();

  Clear();
End;

Procedure TTreeViewDataImpl.BeforeDestruction();
Begin
  FItems := Nil;

  InHerited BeforeDestruction();
End;

Procedure TTreeViewDataImpl.Clear();
Begin
  FDataName  := '';
  FDataValue := '';
End;

Function TTreeViewDataImpl.GetDataName() : String;
Begin
  Result := FDataName;
End;

Procedure TTreeViewDataImpl.SetDataName(Const ADataName : String);
Begin
  FDataName := ADataName;
End;

Function TTreeViewDataImpl.GetDataValue() : String;
Begin
  Result := FDataValue;
End;

Procedure TTreeViewDataImpl.SetDataValue(Const ADataValue : String);
Begin
  FDataValue := ADataValue;
End;

Function TTreeViewDataImpl.GetExpanded() : Boolean;
Begin
  Result := FExpanded;
End;

Procedure TTreeViewDataImpl.SetExpanded(Const AExpanded : Boolean);
Begin
  FExpanded := AExpanded;
End;

Function TTreeViewDataImpl.GetIsSelected() : Boolean;
Begin
  Result := FIsSelected;
End;

Procedure TTreeViewDataImpl.SetIsSelected(Const AIsSelected : Boolean);
Begin
  FIsSelected := AIsSelected;
End;

Function TTreeViewDataImpl.GetItems() : ITreeViewDatas;
Begin
  If Not Assigned(FItems) Then
    FItems := TTreeViewDatas.Create();
  Result := FItems;
End;

Function TTreeViewDatas.Get(Index : Integer) : ITreeViewData;
Begin
  Result := InHerited Items[Index] As ITreeViewData;
End;

Procedure TTreeViewDatas.Put(Index : Integer; Const Item : ITreeViewData);
Begin
  InHerited Items[Index] := Item;
End;

Function TTreeViewDatas.Add() : ITreeViewData;
Begin
  Result := TTreeViewDataImpl.Create();
  InHerited Add(Result);
End;

Function TTreeViewDatas.Add(Const AItem : ITreeViewData) : Integer;
Begin
  Result := InHerited Add(AItem);
End;

Function TTreeViewDatas.GetAsXml() : String;
  Procedure InternalGetAsXml(AStartPoint : ITreeViewDatas; AParent : IXMLNode);
  Var X : Integer;
  Begin
    For X := 0 To AStartPoint.Count - 1 Do
    Begin
      With AParent.AddChild('Item') Do
      Begin
        AddChild('Name').NodeValue       := AStartPoint.Items[X].DataName;
        AddChild('Value').NodeValue      := AStartPoint.Items[X].DataValue;
        AddChild('Expanded').NodeValue   := AStartPoint.Items[X].Expanded;
        AddChild('IsSelected').NodeValue := AStartPoint.Items[X].IsSelected;

        If AStartPoint[X].Items.Count > 0 Then
          InternalGetAsXml(AStartPoint[X].Items, AddChild('Items'));
      End;
    End;
  End;

Var lXml : IXMLDocument;
Begin
  lXml := NewXMLDocument('');
  Try
    InternalGetAsXml(Self, lXml.AddChild('TvSettings'));
    Result := FormatXmlData(lXml.Xml.Text);

    Finally
      lXml := Nil;
  End;
End;

Procedure TTreeViewDatas.SetAsXml(AXmlString : String);
  Procedure InternalSetAsXml(AStartPoint : IXMLNodeList; AParent : ITreeViewDatas);
  Var X     : Integer;
      lItem : ITreeViewData;
  Begin
    For X := 0 To AStartPoint.Count - 1 Do
    Begin
      lItem := AParent.Add();
      With lItem Do
      Begin
        DataName   := AStartPoint[X].ChildNodes['Name'].NodeValue;
        DataValue  := AStartPoint[X].ChildNodes['Value'].NodeValue;
        Expanded   := AStartPoint[X].ChildNodes['Expanded'].NodeValue;
        IsSelected := AStartPoint[X].ChildNodes['IsSelected'].NodeValue;

        If Assigned(AStartPoint[X].ChildNodes.FindNode('Items')) And
           (AStartPoint[X].ChildNodes['Items'].ChildNodes.Count > 0) Then
          InternalSetAsXml(AStartPoint[X].ChildNodes['Items'].ChildNodes, lItem.Items);
      End;
    End;
  End;

Var lXml : IXMLDocument;
Begin
  Clear();

  lXml := LoadXmlData(AXmlString);
  Try
    InternalSetAsXml(lXml.ChildNodes['TvSettings'].ChildNodes, Self);

    Finally
      lXml := Nil;
  End;
End;

(******************************************************************************)

Procedure TTestGitMainFrm.CmdLiveClick(Sender : TObject);
Begin
  ShowMessage('Live');
End;

procedure TTestGitMainFrm.CmdSaySomethingClick(Sender: TObject);
begin
  If EditSaySomething.Text = '' Then
    ShowMessage('Nothing to say.')
  Else
    ShowMessage(EditSaySomething.Text);
end;

procedure TTestGitMainFrm.EditTvValueNameChange(Sender: TObject);
begin
  FPrevData.DataName := TEdit(Sender).Text;
end;

Procedure TTestGitMainFrm.AfterConstruction();
Begin
  InHerited AfterConstruction();

  Top    := FAppConfig.Form.Y;
  Left   := FAppConfig.Form.X;
  Height := FAppConfig.Form.H;
  Width  := FAppConfig.Form.W;
End;

procedure TTestGitMainFrm.FormDestroy(Sender: TObject);
Var lTvSettings : IXmlDocument;
begin
  If Not Assigned(FAppConfig) Then
    FAppConfig := TXMLAppSettings.NewAppSettings();

  FAppConfig.SkinName := SkinManager.CurrentSkinName;
  FAppConfig.Form.WindowState := GetEnumName(TypeInfo(TWindowState), Ord(WindowState));

  If WindowState <> wsMaximized Then
  Begin
    FAppConfig.Form.X := Top;
    FAppConfig.Form.Y := Left;
    FAppConfig.Form.H := Height;
    FAppConfig.Form.W := Width;
  End;

  FAppConfig.Form.ChildNodes.Clear();
  With FAppConfig.Form.Add() Do
  Begin
    SettingName  := 'SplitTv';
    SettingValue := PanTv.Width;
  End;

  With FAppConfig.Form.Add() Do
  Begin
    SettingName  := 'TvCol0Width';
    SettingValue := vstDemo.Header.Columns[0].Width;
  End;

  vstDemo.IterateSubtree(Nil, DoUpdateTreeViewData, Nil);
  lTvSettings := LoadXmlData(FTreeViewData.AsXml);
  FAppConfig.ChildNodes.Remove(FAppConfig.ChildNodes.FindNode('TvSettings'));
  FAppConfig.ChildNodes.Add(lTvSettings.DocumentElement);

  With TStringList.Create() Do
  Try
    Text := FormatXMLData(FAppConfig.Xml);
    SaveToFile(ChangeFileExt(ParamStr(0), '.cfg'));
    Finally
      Free();
  End;
end;

procedure TTestGitMainFrm.FormActivate(Sender: TObject);
Var X, Y, Z : Integer;
begin
  FTreeViewData := TTreeViewData.CreateTreeViewData();

  If FileExists(ChangeFileExt(ParamStr(0), '.cfg')) Then
  Begin
    FAppConfig := TXMLAppSettings.LoadAppSettings(ChangeFileExt(ParamStr(0), '.cfg'));
    FTreeViewData.AsXml := FAppConfig.TvSettings.Xml;
    For X := 0 To FAppConfig.Form.Count - 1 Do
      If SameText(FAppConfig.Form.Component[X].Attributes['SettingName'], 'SplitTv') Then
        PanTv.Width := StrToIntDef(FAppConfig.Form.Component[X].Attributes['SettingValue'], 185)
      Else If SameText(FAppConfig.Form.Component[X].Attributes['SettingName'], 'TvCol0Width') Then
        vstDemo.Header.Columns[0].Width := StrToIntDef(FAppConfig.Form.Component[X].Attributes['SettingValue'], 95);

    Top      := FAppConfig.Form.Y;
    Left     := FAppConfig.Form.X;
    Height   := FAppConfig.Form.H;
    Width    := FAppConfig.Form.W;
    Position := poDesigned;

    SkinManager.SetSkin(FAppConfig.SkinName);
  End
  Else
  For X := 0 To 3 Do
    With FTreeViewData.Add() Do
    Begin
      DataName  := 'Data #' + IntToStr(X);
      DataValue := 'DataValue : ' + IntToStr(X);

      For Y := 0 To 2 Do
        With Items.Add() Do
        Begin
          DataName  := 'Data #' + IntToStr(X) + '-' + IntToStr(Y);
          DataValue := 'DataValue : ' + IntToStr(X) + '-' + IntToStr(Y);

          For Z := 0 To 1 Do
          Begin
            With Items.Add() Do
            Begin
              DataName  := 'Data #' + IntToStr(X) + '-' + IntToStr(Y) + '-' + IntToStr(Z);
              DataValue := 'DataValue : ' + IntToStr(X) + '-' + IntToStr(Y) + '-' + IntToStr(Z);
            End;
          End;
        End;
    End;

  vstDemo.NodeDataSize := SizeOf(IInterface);
  vstDemo.RootNodeCount := FTreeViewData.Count;
  tcMain.ActivePage := sptbxDemo;
  FPrevData := Nil;
end;

procedure TTestGitMainFrm.mnuExitClick(Sender: TObject);
begin
  Close();
end;

procedure TTestGitMainFrm.TbPBarSpeedChange(Sender: TObject);
begin
  Timer.Interval := 1250 - TbPBarSpeed.Position;
end;

procedure TTestGitMainFrm.TimerTimer(Sender: TObject);
begin
  If PBar.Position = PBar.Max Then
    PBar.Position := 0
  Else
    PBar.Position := PBar.Position + 1;
end;

Procedure TTestGitMainFrm.SetNodeData(ANode : PVirtualNode; ANodeData : IInterface);
Var lNodeData : PPointer;
Begin
  lNodeData  := vstDemo.GetNodeData(ANode);
  lNodeData^ := Pointer(ANodeData);
End;

Function TTestGitMainFrm.GetNodeData(ANode : PVirtualNode; AId : TGUID; Var ANodeData) : Boolean;
Var lNodeData : PPointer;
Begin
  If Assigned(ANode) Then
  Begin
    lNodeData := vstDemo.GetNodeData(ANode);
    Result := Assigned(lNodeData) And Assigned(lNodeData^) And
              Supports(IInterface(lNodeData^), AId, ANodeData);
  End
  Else
    Result := False;
End;

Function TTestGitMainFrm.GetNodeData(ANode : PVirtualNode; AId : TGUID) : Boolean;
Var lDummy : IInterface;
Begin
  Result := GetNodeData(ANode, AId, lDummy);
End;

Procedure TTestGitMainFrm.DoUpdateTreeViewData(Sender : TBaseVirtualTree; Node : PVirtualNode; Data : Pointer; Var Abort : Boolean);
Var lData : ITreeViewData;
Begin
  If GetNodeData(Node, ITreeViewData, lData) Then
    With lData Do
    Begin
      Expanded := Sender.Expanded[Node];
      IsSelected := Sender.Selected[Node];
    End;
End;

procedure TTestGitMainFrm.vstDemoCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
Var lData1 ,
    lData2 : ITreeViewData;
begin
  If GetNodeData(Node1, ITreeViewData, lData1) And
     GetNodeData(Node2, ITreeViewData, lData2) Then
    Case Column Of
      0 : Result := CompareText(lData1.DataName, lData2.DataName);
      1 : Result := CompareText(lData1.DataValue, lData2.DataValue);
    End;
end;

procedure TTestGitMainFrm.vstDemoFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
Var lData : ITreeViewData;
begin
  If Column = 1 Then
    vstDemo.EditNode(Node, Column);

  If Assigned(FPrevData) Then
  Begin
    FPrevData.DataName  := EditTvValueName.Text;
    FPrevData.DataValue := EditTvValueValue.Text;
  End;

  If GetNodeData(Node, ITreeViewData, lData) Then
  Begin
    FPrevData := lData;

    EditTvValueName.Text  := FPrevData.DataName;
    EditTvValueValue.Text := FPrevData.DataValue;
  End;
end;

procedure TTestGitMainFrm.vstDemoGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
begin
  ImageIndex := Node.Index;
end;

procedure TTestGitMainFrm.vstDemoGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
Var lData : ITreeViewData;
begin
  CellText := '';

  If GetNodeData(Node, ITreeViewData, lData) Then
    Case Column Of
      0 : CellText := lData.DataName;
      1 : CellText := lData.DataValue;
    End;
end;

procedure TTestGitMainFrm.vstDemoHeaderClick(Sender: TVTHeader;
  Column: TColumnIndex; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  If vstDemo.Header.SortColumn = Column Then
    If vstDemo.Header.SortDirection = sdAscending Then
      vstDemo.Header.SortDirection := sdDescending
    Else
      vstDemo.Header.SortDirection := sdAscending
  Else
    vstDemo.Header.SortDirection := sdAscending;

  vstDemo.Header.SortColumn := Column;
  vstDemo.SortTree(Column, vstDemo.Header.SortDirection);
end;

procedure TTestGitMainFrm.vstDemoInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
Var lData : ITreeViewData;
begin
  If Assigned(ParentNode) Then
  Begin
    If GetNodeData(ParentNode, ITreeViewData, lData) Then
    Begin
      SetNodeData(Node, lData.Items[Node.Index]);
      If lData.Items[Node.Index].Items.Count > 0 Then
        Node.States := Node.States + [vsHasChildren];
      Sender.Expanded[Node] := lData.Items[Node.Index].Expanded;
      Sender.Selected[Node] := lData.Items[Node.Index].IsSelected;
    End;
  End
  Else
  Begin
    SetNodeData(Node, FTreeViewData[Node.Index]);
    If FTreeViewData[Node.Index].Items.Count > 0 Then
      Node.States := Node.States + [vsHasChildren];
    Sender.Expanded[Node] := FTreeViewData[Node.Index].Expanded;
    Sender.Selected[Node] := FTreeViewData[Node.Index].IsSelected;
  End;
end;

procedure TTestGitMainFrm.vstDemoNewText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; NewText: WideString);
Var lData : ITreeViewData;
begin
  If GetNodeData(Node, ITreeViewData, lData) Then
    Case Column Of
      0 : lData.DataName  := NewText;
      1 : lData.DataValue := NewText;
    End;
end;

procedure TTestGitMainFrm.vstDemoInitChildren(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var ChildCount: Cardinal);
Var lData : ITreeViewData;
begin
  If GetNodeData(Node, ITreeViewData, lData) Then
    ChildCount := lData.Items.Count;
end;

procedure TTestGitMainFrm.mnuAboutClick(Sender: TObject);
begin
  With TAboutDlg.Create(Self) Do
  Try
    ShowModal();
    
    Finally
      Release();
  End;
end;

procedure TTestGitMainFrm.CmdOkClick(Sender: TObject);
begin
  If RgOptions.ItemIndex > -1 Then
    ShowMessage(RgOptions.Items[RgOptions.ItemIndex])
  Else
    ShowMessage('Please select an option.');
end;

procedure TTestGitMainFrm.CmdPBarGoClick(Sender: TObject);
begin
  Timer.Enabled := Not Timer.Enabled;

  If Timer.Enabled Then
    CmdPBarGo.Caption := 'Stop'
  Else
    CmdPBarGo.Caption := 'Go';
end;

procedure TTestGitMainFrm.chkIsCheckedClick(Sender: TObject);
begin
  If chkIsChecked.Checked Then
    chkIsChecked.Caption := 'Is Checked? Yes'
  Else
    chkIsChecked.Caption := 'Is Checked? No';
end;

Procedure TTestGitMainFrm.CmdBetaClick(Sender : TObject);
Begin
  ShowMessage('Beta');
End;

Procedure TTestGitMainFrm.CmdDevClick(Sender : TObject);
Begin
  ShowMessage('Dev');
End;

End.

