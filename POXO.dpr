program POXO;

uses
  Forms,
  UOXO in 'UOXO.pas' {OXOForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TOXOForm, OXOForm);
  Application.Run;
end.
