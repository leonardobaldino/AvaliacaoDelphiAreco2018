unit classProduto;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.SysUtils, FMX.Objects, System.Classes, FMX.Graphics;

type
  TProduto = class
  private
    FEstoqueAtual: Double;
    FPeso: Double;
    FEstoqueMinimo: Double;
    FDescricao: String;
    FID: Integer;
    FCodigoBarra: String;
    FUnidade: String;
    FEstoqueMaximo: Double;
    FFoto: TImage;
    procedure SetCodigoBarra(const Value: String);
    procedure SetDescricao(const Value: String);
    procedure SetEstoqueAtual(const Value: Double);
    procedure SetEstoqueMaximo(const Value: Double);
    procedure SetEstoqueMinimo(const Value: Double);
    procedure SetID(const Value: Integer);
    procedure SetPeso(const Value: Double);
    procedure SetUnidade(const Value: String);
  public
    property ID: Integer read FID write SetID;
    property CodigoBarra: String read FCodigoBarra write SetCodigoBarra;
    property Unidade: String read FUnidade write SetUnidade;
    property Peso: Double read FPeso write SetPeso;
    property Descricao: String read FDescricao write SetDescricao;
    property EstoqueMinimo: Double read FEstoqueMinimo write SetEstoqueMinimo;
    property EstoqueMaximo: Double read FEstoqueMaximo write SetEstoqueMaximo;
    property EstoqueAtual: Double read FEstoqueAtual write SetEstoqueAtual;

    constructor create;
    destructor Destroy; override;
    procedure SalvarProduto;
    procedure ExcluirProduto(xID: Integer);
  end;

implementation

{ TProduto }

uses unDM, unLib;

constructor TProduto.create;
begin
  inherited create;
end;

destructor TProduto.Destroy;
begin
  inherited Destroy;
end;

procedure TProduto.ExcluirProduto(xID: Integer);
begin
  TLib.ExecutaSQL('EXECUTE PROCEDURE PRODUTO_DELETE(' + IntToStr(xID) + ')');
end;

procedure TProduto.SalvarProduto;
var
  LPeso, LEstoqueMinimo, LEstoqueMaximo, LEstoqueAtual: String;
begin
  if Trim(Self.CodigoBarra) <> EmptyStr then
  begin
    TLib.ExecutaSQL('EXECUTE PROCEDURE PRODUTO_UPDATE(' +
      QuotedStr('CODIGOBARRA') + ', 0, False, 0, ' + QuotedStr(Self.CodigoBarra)
      + ', ' + IntToStr(Self.ID) + ', null)');
  end;

  if Trim(Self.Unidade) <> EmptyStr then
  begin
    TLib.ExecutaSQL('EXECUTE PROCEDURE PRODUTO_UPDATE(' + QuotedStr('UNIDADE') +
      ', 0, False, 0, ' + QuotedStr(Self.Unidade) + ', ' + IntToStr(Self.ID) +
      ', null)');
  end;

  LPeso := TLib.TrocarVirgula(Self.Peso);
  TLib.ExecutaSQL('EXECUTE PROCEDURE PRODUTO_UPDATE(' + QuotedStr('PESO') +
    ', 0, False, ' + LPeso + ', null, ' + IntToStr(Self.ID) + ', null)');

  if Trim(Self.Descricao) <> EmptyStr then
  begin
    TLib.ExecutaSQL('EXECUTE PROCEDURE PRODUTO_UPDATE(' + QuotedStr('DESCRICAO')
      + ', 0, False, 0, ' + QuotedStr(Self.Descricao) + ', ' + IntToStr(Self.ID)
      + ', null)');
  end;

  LEstoqueMinimo := TLib.TrocarVirgula(Self.EstoqueMinimo);
  TLib.ExecutaSQL('EXECUTE PROCEDURE PRODUTO_UPDATE(' +
    QuotedStr('ESTOQUEMINIMO') + ', 0, False, ' + LEstoqueMinimo + ', null, ' +
    IntToStr(Self.ID) + ', null)');

  LEstoqueMaximo := TLib.TrocarVirgula(Self.EstoqueMaximo);
  TLib.ExecutaSQL('EXECUTE PROCEDURE PRODUTO_UPDATE(' +
    QuotedStr('ESTOQUEMAXIMO') + ', 0, False, ' + LEstoqueMinimo + ', null, ' +
    IntToStr(Self.ID) + ', null)');

  LEstoqueAtual := TLib.TrocarVirgula(Self.EstoqueAtual);
  TLib.ExecutaSQL('EXECUTE PROCEDURE PRODUTO_UPDATE(' +
    QuotedStr('ESTOQUEATUAL') + ', 0, False, ' + LEstoqueMinimo + ', null, ' +
    IntToStr(Self.ID) + ', null)');
end;

procedure TProduto.SetCodigoBarra(const Value: String);
begin
  if Self <> nil then
    FCodigoBarra := Value;
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  if Self <> nil then
    FDescricao := Value;
end;

procedure TProduto.SetEstoqueAtual(const Value: Double);
begin
  if Self <> nil then
    FEstoqueAtual := Value;
end;

procedure TProduto.SetEstoqueMaximo(const Value: Double);
begin
  if Self <> nil then
    FEstoqueMaximo := Value;
end;

procedure TProduto.SetEstoqueMinimo(const Value: Double);
begin
  if Self <> nil then
    FEstoqueMinimo := Value;
end;

procedure TProduto.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TProduto.SetPeso(const Value: Double);
begin
  if Self <> nil then
    FPeso := Value;
end;

procedure TProduto.SetUnidade(const Value: String);
begin
  if Self <> nil then
    FUnidade := Value;
end;

end.
