Unit TestGitMain;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, ExtCtrls, SynEditHighlighter,
  SynHighlighterPas, SynEdit, SynMemo, VirtualTrees, ImgList;

Type
  ITreeViewDatas = Interface;
  
  ITreeViewData = Interface(IInterface)
    ['{4B61686E-29A0-2112-ABA4-5433658EFC37}']
    Function  GetDataName() : String;
    Procedure SetDataName(Const ADataName : String);

    Function  GetDataValue() : String;
    Procedure SetDataValue(Const ADataValue : String);

    Function GetItems() : ITreeViewDatas;

    Property DataName  : String         Read GetDataName  Write SetDataName;
    Property DataValue : String         Read GetDataValue Write SetDataValue;
    Property Items     : ITreeViewDatas Read GetItems;

  End;

  ITreeViewDatas = Interface(IInterfaceList)
    ['{4B61686E-29A0-2112-B570-7FBE95FE32F6}']
    Function  Get(Index : Integer) : ITreeViewData;
    Procedure Put(Index : Integer; Const Item : ITreeViewData);

    Function Add() : ITreeViewData; OverLoad;
    Function Add(Const AItem : ITreeViewData) : Integer; OverLoad;

    Property Items[Index : Integer] : ITreeViewData Read Get Write Put; Default;

  End;

  TTestGitMainFrm = Class(TForm)
    chkIsChecked: TCheckBox;
    CmdOk: TButton;
    CmdPBarGo: TButton;
    CmdSaySomething: TButton;
    EditSaySomething: TEdit;
    EditTvValueName: TEdit;
    EditTvValueValue: TEdit;
    GbSaySomething: TGroupBox;
    ilTreeView: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu: TMainMenu;
    MemoSrc: TSynMemo;
    mnuAbout: TMenuItem;
    mnuExit: TMenuItem;
    mnuFile: TMenuItem;
    mnuHelp: TMenuItem;
    PanTv: TPanel;
    PanTvDemo: TPanel;
    PBar: TProgressBar;
    pcMain: TPageControl;
    RgOptions: TRadioGroup;
    SBar: TStatusBar;
    Splitter: TSplitter;
    SynPasSyn1: TSynPasSyn;
    TbPBarSpeed: TTrackBar;
    Timer: TTimer;
    tsDemo: TTabSheet;
    tsSynEditDemo: TTabSheet;
    tsTreeView: TTabSheet;
    vstDemo: TVirtualStringTree;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    Procedure CmdLiveClick(Sender : TObject);
    Procedure CmdBetaClick(Sender : TObject);
    Procedure CmdDevClick(Sender : TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure CmdOkClick(Sender: TObject);
    procedure CmdSaySomethingClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure CmdPBarGoClick(Sender: TObject);
    procedure chkIsCheckedClick(Sender: TObject);
    procedure TbPBarSpeedChange(Sender: TObject);

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
    procedure EditTvValueNameChange(Sender: TObject);

  Private
    FTreeViewData : ITreeViewDatas;
    FPrevData     : ITreeViewData;
    
    Procedure SetNodeData(ANode : PVirtualNode; ANodeData : IInterface);
    Function  GetNodeData(ANode : PVirtualNode; AId : TGUID; Var ANodeData) : Boolean; OverLoad;
    Function  GetNodeData(ANode : PVirtualNode; AId : TGUID) : Boolean; OverLoad;

  Public

  End;

Type
  TTreeViewData = Class(TObject)
  Public
    Class Function CreateTreeViewData() : ITreeViewDatas;

  End;
Var
  TestGitMainFrm : TTestGitMainFrm;

Implementation

Uses AboutFrm;

{$R *.dfm}

Type
  TTreeViewDataImpl = Class(TInterfacedObject, ITreeViewData)
  Private
    FDataName  : String;
    FDataValue : String;
    FItems     : ITreeviewDatas;

  Protected
    Function  GetDataName() : String;
    Procedure SetDataName(Const ADataName : String);

    Function  GetDataValue() : String;
    Procedure SetDataValue(Const ADataValue : String);

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

    Function Add() : ITreeViewData; OverLoad;
    Function Add(Const AItem : ITreeViewData) : Integer; OverLoad;

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

procedure TTestGitMainFrm.FormCreate(Sender: TObject);
Var X, Y, Z : Integer;
begin
  FTreeViewData := TTreeViewData.CreateTreeViewData();

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
  pcMain.ActivePage := tsDemo;
  FPrevData := Nil;
end;

procedure TTestGitMainFrm.FormDestroy(Sender: TObject);
begin
  FTreeViewData := Nil;
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
    End;
  End
  Else
  Begin
    SetNodeData(Node, FTreeViewData[Node.Index]);
    If FTreeViewData[Node.Index].Items.Count > 0 Then
      Node.States := Node.States + [vsHasChildren];
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

