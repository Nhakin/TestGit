program TestGit;

uses
  Forms,
  TestGitMain in 'TestGitMain.pas' {TestGitMainFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTestGitMainFrm, TestGitMainFrm);
  Application.Run;
end.
