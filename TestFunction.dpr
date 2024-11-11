program TestFunction;

uses
  Vcl.Forms,
  mainUnit in 'mainUnit.pas' {mainForm},
  ThreadsUnit in 'ThreadsUnit.pas' {ThreadsForm},
  translate in 'translate.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.HelpFile := '';
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TThreadsForm, ThreadsForm);
  Application.Run;
end.
