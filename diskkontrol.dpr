program diskkontrol;

uses
  Vcl.Forms,
  System.SysUtils,
  diskmainform in 'diskmainform.pas' {diskmainformf},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  // /tray parametresiyle (Windows baslangicindan) pencere gosterilmeden bildirim alaninda baslar
  Application.ShowMainForm := not FindCmdLineSwitch('tray', ['/', '-'], True);
  TStyleManager.TrySetStyle('Cobalt XEMedia');
  Application.CreateForm(Tdiskmainformf, diskmainformf);
  Application.Run;
end.
