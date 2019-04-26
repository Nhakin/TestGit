Unit TestGitMain;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, ExtCtrls;

Type
  TTestGitMainFrm = Class(TForm)
    CmdLive : TButton;
    CmdBeta : TButton;
    CmdDev  : TButton;
    SBar: TStatusBar;
    MainMenu: TMainMenu;
    mnuFile: TMenuItem;
    mnuAbout: TMenuItem;
    N1: TMenuItem;
    mnuExit: TMenuItem;
    RgOptions: TRadioGroup;
    CmdOk: TButton;
    GbSaySomething: TGroupBox;
    EditSaySomething: TEdit;
    CmdSaySomething: TButton;

    Procedure CmdLiveClick(Sender : TObject);
    Procedure CmdBetaClick(Sender : TObject);
    Procedure CmdDevClick(Sender : TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure CmdOkClick(Sender: TObject);
    procedure CmdSaySomethingClick(Sender: TObject);

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

procedure TTestGitMainFrm.CmdSaySomethingClick(Sender: TObject);
begin
  If EditSaySomething.Text = '' Then
    ShowMessage('Nothing to say.')
  Else
    ShowMessage(EditSaySomething.Text);
end;

procedure TTestGitMainFrm.mnuExitClick(Sender: TObject);
begin
  Close();
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

Procedure TTestGitMainFrm.CmdBetaClick(Sender : TObject);
Begin
  ShowMessage('Beta');
End;

Procedure TTestGitMainFrm.CmdDevClick(Sender : TObject);
Begin
  ShowMessage('Dev');
End;

End.

