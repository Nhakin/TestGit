program TestGit;

uses
  Forms,
  TestGitMain in 'TestGitMain.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Test Git';
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
