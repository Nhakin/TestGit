Unit TestGitMain;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus;

Type
  TTestGitMainFrm = Class(TForm)
    SBar: TStatusBar;
    MainMenu: TMainMenu;
    mnuFile: TMenuItem;
    mnuAbout: TMenuItem;
    N1: TMenuItem;
    mnuExit: TMenuItem;
    mnuVersion: TMenuItem;
    mnuLive: TMenuItem;
    mnuBeta: TMenuItem;
    mnuDev: TMenuItem;

    Procedure CmdLiveClick(Sender : TObject);
    Procedure CmdBetaClick(Sender : TObject);
    Procedure CmdDevClick(Sender : TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);

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

procedure TTestGitMainFrm.mnuExitClick(Sender: TObject);
begin
  Close();
end;

procedure TTestGitMainFrm.mnuAboutClick(Sender: TObject);
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

