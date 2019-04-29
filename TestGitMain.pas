Unit TestGitMain;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, ExtCtrls, SynEditHighlighter,
  SynHighlighterPas, SynEdit, SynMemo, VirtualTrees;

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
    SBar: TStatusBar;
    pcMain: TPageControl;
    tsDemo: TTabSheet;
    tsTreeView: TTabSheet;
    Label1: TLabel;
    RgOptions: TRadioGroup;
    CmdOk: TButton;
    GbSaySomething: TGroupBox;
    EditSaySomething: TEdit;
    CmdSaySomething: TButton;
    PBar: TProgressBar;
    CmdPBarGo: TButton;
    chkIsChecked: TCheckBox;
    TbPBarSpeed: TTrackBar;
    MainMenu: TMainMenu;
    mnuFile: TMenuItem;
    SynPasSyn1: TSynPasSyn;
    mnuAbout: TMenuItem;
    N1: TMenuItem;
    mnuExit: TMenuItem;
    Timer: TTimer;
    tsSynEditDemo: TTabSheet;
    MemoSrc: TSynMemo;
    vstDemo: TVirtualStringTree;
    Splitter: TSplitter;
    PanTvDemo: TPanel;

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
    procedure FormCreate(Sender: TObject);

    procedure vstDemoInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure vstDemoGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure vstDemoInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var ChildCount: Cardinal);

  Private
    FTreeViewData : ITreeViewDatas;

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

procedure TTestGitMainFrm.vstDemoGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);

Var lData : ITreeViewData;
begin
  If GetNodeData(Node, ITreeViewData, lData) Then
    CellText := lData.DataName;
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

procedure TTestGitMainFrm.vstDemoInitChildren(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var ChildCount: Cardinal);
Var lData : ITreeViewData;
begin
  If GetNodeData(Node, ITreeViewData, lData) Then
    ChildCount := lData.Items.Count;
end;

procedure TTestGitMainFrm.mnuAboutClick(Sender: TObject);
begin
  ShowMessage('TestGit');
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

