Unit TestGitMain;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

Type
  TTestGitMainFrm = Class(TForm)
    CmdLive : TButton;
    CmdBeta : TButton;
    CmdDev  : TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    About1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;

    Procedure CmdLiveClick(Sender : TObject);
    Procedure CmdBetaClick(Sender : TObject);
    Procedure CmdDevClick(Sender : TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);

  Private

  Public

  End;

Var
  TestGitMainFrm : TTestGitMainFrm;

Implementation

{$R *.dfm}

Procedure TTestGitMainFrm.CmdLiveClick(Sender : TObject);
Begin
  ShowMessage('Live');
End;

procedure TTestGitMainFrm.Exit1Click(Sender: TObject);
begin
  Close();
end;

procedure TTestGitMainFrm.About1Click(Sender: TObject);
begin
  ShowMessage('TestGit');
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

