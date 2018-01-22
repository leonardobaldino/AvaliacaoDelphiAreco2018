program prArecoTeste;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  System.StartUpCopy,
  FMX.Forms,
  unMain in 'unMain.pas' {frmMain},
  classProduto in 'classProduto.pas',
  unDM in 'unDM.pas' {DM: TDataModule},
  unLib in 'unLib.pas',
  unConfigurarServidor in 'unConfigurarServidor.pas' {frameConfigurarServidor: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TframeConfigurarServidor, frameConfigurarServidor);
  Application.Run;
end.
