Unit TestGitMain;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

Type
  TTestGitMainFrm = Class(TForm)
    CmdLive : TButton;
    CmdBeta : TButton;
    CmdDev  : TButton;
    StatusBar1: TStatusBar;

    Procedure CmdLiveClick(Sender : TObject);
    Procedure CmdBetaClick(Sender : TObject);
    Procedure CmdDevClick(Sender : TObject);

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

Procedure TTestGitMainFrm.CmdBetaClick(Sender : TObject);
Begin
  ShowMessage('Beta');
End;

Procedure TTestGitMainFrm.CmdDevClick(Sender : TObject);
Begin
  ShowMessage('Dev');
End;

End.

