program TestGit;

uses
  Forms,
  TestGitMain in 'TestGitMain.pas' {TestGitMainFrm},
  AboutFrm in 'AboutFrm.pas' {AboutDlg},
  ClsAppConfig in 'ClsAppConfig.pas';

{$R *.res}

begin
  {$IfDef Debug}
    ReportMemoryLeaksOnShutdown := True;
  {$EndIf}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Test Git';
  Application.CreateForm(TTestGitMainFrm, TestGitMainFrm);
  Application.Run;
end.
