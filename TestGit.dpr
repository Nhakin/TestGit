program TestGit;

uses
  Forms,
  TestGitMain in 'TestGitMain.pas' {TestGitMainFrm},
  AboutFrm in 'AboutFrm.pas' {AboutDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Test Git';
  Application.CreateForm(TTestGitMainFrm, TestGitMainFrm);
  Application.Run;
end.
