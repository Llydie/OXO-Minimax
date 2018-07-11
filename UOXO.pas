unit UOXO;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, Grids, StdCtrls, Vcl.ExtCtrls, Vcl.Menus;

type
  TGame = array [0 .. 2, 0 .. 2] of integer;

type
  TMove = record
    i, j: integer;
  end;

type
  TResult = record
    Score: integer;
    Move: TMove;
  end;

type
  TOXOForm = class(TForm)
    OXOGrid: TStringGrid;
    Resultlbl: TLabel;
    RG1: TRadioGroup;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Label2: TLabel;
    Label3: TLabel;
    OScore1: TLabel;
    XScore1: TLabel;
    ContinueButton: TButton;
    RG2: TRadioGroup;
    Label4: TLabel;
    Menu1: TMenuItem;
    New1: TMenuItem;
    Exit1: TMenuItem;
    CompText: TLabel;
    RG3: TRadioGroup;
    Label5: TLabel;
    procedure OXOGridClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure RG1Click(Sender: TObject);
    procedure ContinueButtonClick(Sender: TObject);
    procedure RG2Click(Sender: TObject);
    procedure RG3Click(Sender: TObject);
  private
    { Private declarations }
    CurrentSymbol: integer;
    MovesMade, XScore, OScore, choice: integer;
    Game: TGame;
    procedure ClearGrid;
    procedure NewGame;
    procedure ComputerMove(symbol: integer);
    procedure CheckWon;
    function Stringify(i: integer): string;
    function HasWon(symbol: integer): boolean;
    function MaxTurn(symbol: integer): TResult;
    function MinTurn(symbol: integer): TResult;
    function Score(symbol: integer): integer;
  public
    { Public declarations }
  end;

const
  X = 1;
  O = 2;
  EMPTY = 0;

var
  OXOForm: TOXOForm;

implementation

{$R *.dfm}

function TOXOForm.MaxTurn(symbol: integer): TResult;
var
  i, j, otherSymbol: integer;
  max, currentMove, endMove: TResult;
begin
  if symbol = X then
    otherSymbol := O
  else
    otherSymbol := X;

  if HasWon(symbol) then
  begin
    endMove.Score := Score(symbol);
    endMove.Move.i := -1;
    endMove.Move.j := -1;
    result := endMove;
  end
  else
  begin
    max.Score := -1000;
    max.Move.i := -1;
    max.Move.j := -1;

    for i := 0 to 2 do
    begin
      for j := 0 to 2 do
      begin
        if Game[i, j] = EMPTY then
        begin
          Game[i, j] := symbol;

          currentMove := MinTurn(otherSymbol);

          if currentMove.Score > max.Score then
          begin
            max.Score := currentMove.Score;
            max.Move.i := i;
            max.Move.j := j;
          end;
          Game[i, j] := EMPTY;
        end;
      end;
    end;
    result := max;
  end;
end;

function TOXOForm.MinTurn(symbol: integer): TResult;
var
  i, j, otherSymbol: integer;
  min, currentMove, endMove: TResult;
begin
  if symbol = X then
    otherSymbol := O
  else
    otherSymbol := X;
  if HasWon(symbol) then
  begin
    endMove.Score := Score(symbol);
    endMove.Move.i := -1;
    endMove.Move.j := -1;
    result := endMove;
  end
  else
  begin
    min.Score := 1000;
    min.Move.i := -1;
    min.Move.j := -1;

    for i := 0 to 2 do
    begin
      for j := 0 to 2 do
      begin
        if Game[i, j] = EMPTY then
        begin
          Game[i, j] := symbol;

          currentMove := MaxTurn(otherSymbol);

          if currentMove.Score < min.Score then
          begin
            min.Score := currentMove.Score;
            min.Move.i := i;
            min.Move.j := j;
          end;
          Game[i, j] := EMPTY;
        end;
      end;
    end;
    result := min;
  end;
end;

procedure TOXOForm.CheckWon;
begin
  if HasWon(CurrentSymbol) then
  begin
    Resultlbl.Caption := Stringify(CurrentSymbol) + ' has won';
    Resultlbl.Visible := true;
    OXOGrid.Enabled := false;
    if CurrentSymbol = X then
    begin
      XScore := XScore + 1;
      XScore1.Caption := inttostr(XScore);
    end;
    if CurrentSymbol = O then
    begin
      OScore := OScore + 1;
      OScore1.Caption := inttostr(OScore);
    end;
    exit
  end
  else if MovesMade = 9 then
  begin
    Resultlbl.Caption := 'It''s a draw';
    Resultlbl.Visible := true;
    OXOGrid.Enabled := false;
  end;
end;

procedure TOXOForm.ClearGrid;
// method to clear the grid
var
  col, row, i, j: integer;
begin
  for row := 0 to 2 do
  begin
    for col := 0 to 2 do
    begin
      OXOGrid.Cells[col, row] := '';
    end;
  end;

  for i := 0 to 2 do
  begin
    for j := 0 to 2 do
    begin
      Game[i, j] := EMPTY;
    end;
  end;
end;

procedure TOXOForm.ContinueButtonClick(Sender: TObject);
begin
  ClearGrid;
  MovesMade := 0;
  Resultlbl.Visible := false;
  OXOGrid.Enabled := true;
  if RG1.ItemIndex = 0 then
    CurrentSymbol := O;
  if RG1.ItemIndex = 1 then
    CurrentSymbol := X;
  if (RG2.ItemIndex = 1) and (RG3.ItemIndex = 1) then
  begin
    ComputerMove(CurrentSymbol); // computer starts
  end;
end;

procedure TOXOForm.Exit1Click(Sender: TObject);
begin
  OXOForm.DestroyWnd;
end;

procedure TOXOForm.FormCreate(Sender: TObject);
begin
  NewGame;
end;

procedure TOXOForm.New1Click(Sender: TObject);
begin
  NewGame;
end;

procedure TOXOForm.ComputerMove(symbol: integer);
var
  result: TResult;
  bestMove: TMove;
begin
  result := MaxTurn(symbol);
  bestMove := result.Move;
  Game[bestMove.i, bestMove.j] := symbol;
  OXOGrid.Cells[bestMove.i, bestMove.j] := Stringify(symbol);
  MovesMade := MovesMade + 1;
end;

procedure TOXOForm.NewGame;
var
  computerSymbol, humanSymbol: integer;
  Game: TGame;
begin
  randomize;
  ClearGrid;

  MovesMade := 0;
  XScore := 0;
  OScore := 0;
  Resultlbl.Visible := false;
  OXOGrid.Enabled := true;
  if RG1.ItemIndex = 0 then
  begin
    computerSymbol := O;
    humanSymbol := X;
    CurrentSymbol := O;
  end;
  if RG1.ItemIndex = 1 then
  begin
    computerSymbol := X;
    humanSymbol := O;
    CurrentSymbol := X;
  end;
  if (RG2.ItemIndex = 1) and (RG3.ItemIndex = 1) then
  begin
    ComputerMove(computerSymbol); // computer starts
  end;

  XScore1.Caption := inttostr(XScore);
  OScore1.Caption := inttostr(OScore);
end;

procedure TOXOForm.OXOGridClick(Sender: TObject);
// event handler for clicking the OXO grid
// if the current cell is empty then the currentsymbol is displayed in it
// the currentsymbol is then toggled
// note how the current cell in a StringGrid is referenced using the Col and Row
// properties
begin
  if CurrentSymbol = X then
    CurrentSymbol := O
  else
    CurrentSymbol := X;
  if OXOGrid.Cells[OXOGrid.col, OXOGrid.row] = Stringify(EMPTY) then
  begin
    OXOGrid.Cells[OXOGrid.col, OXOGrid.row] := Stringify(CurrentSymbol);
    Game[OXOGrid.col, OXOGrid.row] := CurrentSymbol;
    CheckWon;
    MovesMade := MovesMade + 1;
    if RG2.ItemIndex = 1 then
    begin
      if CurrentSymbol = X then
        CurrentSymbol := O
      else
        CurrentSymbol := X;
      ComputerMove(CurrentSymbol);
      CheckWon;
    end;
  end;

end;

procedure TOXOForm.RG1Click(Sender: TObject);
begin
  NewGame;
end;

procedure TOXOForm.RG2Click(Sender: TObject);
begin
  NewGame;
end;

procedure TOXOForm.RG3Click(Sender: TObject);
begin
  NewGame;
end;

function TOXOForm.Score(symbol: integer): integer;
var
  otherSymbol: integer;
begin
  if symbol = X then
    otherSymbol := O
  else
    otherSymbol := X;

  if HasWon(symbol) then
    result := 10
  else if HasWon(otherSymbol) then
    result := -10
  else
    result := 0;
end;

function TOXOForm.Stringify(i: integer): string;
begin
  if i = X then
    result := 'X'
  else if i = O then
    result := 'O'
  else if i = EMPTY then
    result := '';

end;

function TOXOForm.HasWon(symbol: integer): boolean;
var
  col, row: integer;
begin
  result := false;
  // check columns
  for col := 0 to 2 do
  begin
    if (Game[col, 0] = symbol) and (symbol = Game[col, 1]) and
      (symbol = Game[col, 2]) then
      result := true;
  end;
  // check rows
  for row := 0 to 2 do
  begin
    if (Game[0, row] = symbol) and (symbol = Game[1, row]) and
      (symbol = Game[2, row]) then
      result := true;
  end;
  // check diagonals
  if (Game[0, 0] = symbol) and (symbol = Game[1, 1]) and (symbol = Game[2, 2])
  then
    result := true;
  if (Game[2, 0] = symbol) and (symbol = Game[1, 1]) and (symbol = Game[0, 2])
  then
    result := true;

end;

end.
