unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Value1: TButton;
    Value2: TButton;
    Value3: TButton;
    Value4: TButton;
    Value5: TButton;
    Value6: TButton;
    Value7: TButton;
    Value8: TButton;
    Value9: TButton;
    Solve: TButton;
    Clear: TButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Erase: TButton;
    Shape5: TShape;
    Button1: TButton;
    Button2: TButton;
    procedure Value1Click(Sender: TObject);
    procedure Value2Click(Sender: TObject);
    procedure Value3Click(Sender: TObject);
    procedure Value4Click(Sender: TObject);
    procedure Value5Click(Sender: TObject);
    procedure Value6Click(Sender: TObject);
    procedure Value7Click(Sender: TObject);
    procedure Value8Click(Sender: TObject);
    procedure Value9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SolveClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure EraseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure ButtonClick(Sender: TObject);
    function  IsValid(number, index, index2 : integer):boolean;
    function  IsNumberInRow(number, row : integer):boolean;
    function  IsNumberInColumn(number, column : integer):boolean;
    function  RecursiveSolve(idx1,idx2 : integer):boolean; 
  public
    sudokubuttonarray : array [1..9,1..9] of Tbutton;
    sudokuarray : array [1..9,1..9] of integer;
    buttonvalue : integer;
    choiceAmount : integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.RecursiveSolve(idx1, idx2:integer):boolean;
var
number:integer;
return:boolean;
begin
  RecursiveSolve:=false;
  if idx2 = 10 then
    RecursiveSolve:=true
  else
    begin
      if sudokuarray[idx1,idx2] > 0 then
        begin
          if idx1 <> 9 then
            return := RecursiveSolve(idx1 + 1, idx2)
          else
            return := RecursiveSolve(1, idx2+1);

          RecursiveSolve:=return;
          if return = true then
            exit;
        end
      else
        begin
          for number := 1 to 9 do
            begin
              if IsValid(number, idx1, idx2) = true then
                begin
                  sudokuarray[idx1,idx2]:=number;
                  if idx1 <> 9 then
                    return := RecursiveSolve(idx1 + 1, idx2)
                  else
                    return := RecursiveSolve(1, idx2+1);

                  RecursiveSolve := return;

                  if return = true then
                    exit
                  else
                    sudokuarray[idx1,idx2] := 0;
                end;
            end;
        end;
    end;
end;



function TForm1.IsNumberInRow(number, row : integer):boolean;
var
 index: integer;
begin
  IsNumberInRow := false;
  for index := 1 to 9 do
    begin
      if sudokuarray[row,index] = number then
        IsNumberInRow := true;
    end;
end;

function TForm1.IsNumberInColumn(number, column : integer):boolean;
var
 index: integer;
begin
  IsNumberInColumn := false;
  for index := 1 to 9 do
    begin
      if sudokuarray[index,column] = number then
        IsNumberInColumn := true;
    end;
end;


function TForm1.IsValid(number, index, index2 : integer):boolean;
var
  counter : integer;
  row, column : integer;
begin
  IsValid := true;
  if sudokuarray[index,index2] > 0 then
    IsValid := false;
  for counter := 1 to 9 do
    begin
      if sudokuarray[counter,index2] = number then
        IsValid := false
      else if sudokuarray[index,counter] = number then
        IsValid := false;
    end;
  if (index >= 1) and (index <= 3) then
    begin
      if (index2 >= 1) and (index2 <= 3) then
        begin
          for row := 1 to 3 do
            begin
              for column := 1 to 3 do
                begin
                  if sudokuarray[row,column] = number then
                    IsValid := false
                end;
            end;
         end
      else if (index2 >= 4) and (index2 <= 6) then
        begin
          for row := 1 to 3 do
            begin
              for column := 4 to 6 do
                begin
                  if sudokuarray[row,column] = number then
                    IsValid := false
                end;
            end;
         end
      else if (index2 >= 7) and (index2 <= 9) then
        begin
          for row := 1 to 3 do
            begin
              for column := 7 to 9 do
                begin
                  if sudokuarray[row,column] = number then
                    IsValid := false
                end;
            end;
         end;
    end
  else if (index >= 4) and (index <= 6) then
    begin
      if (index2 >= 1) and (index2 <= 3) then
        begin
          for row := 4 to 6 do
            begin
              for column := 1 to 3 do
                begin
                  if sudokuarray[row,column] = number then
                    IsValid := false
                end;
            end;
         end
      else if (index2 >= 4) and (index2 <= 6) then
        begin
          for row := 4 to 6 do
            begin
              for column := 4 to 6 do
                begin
                  if sudokuarray[row,column] = number then
                    IsValid := false
                end;
            end;
         end
      else if (index2 >= 7) and (index2 <= 9) then
        begin
          for row := 4 to 6 do
            begin
              for column := 7 to 9 do
                begin
                  if sudokuarray[row,column] = number then
                    IsValid := false
                end;
            end;
         end;
    end
  else if (index >= 7) and (index <= 9) then
    begin
      if (index2 >= 1) and (index2 <= 3) then
        begin
          for row := 7 to 9 do
            begin
              for column := 1 to 3 do
                begin
                  if sudokuarray[row,column] = number then
                    IsValid := false
                end;
            end;
         end
      else if (index2 >= 4) and (index2 <= 6) then
        begin
          for row := 7 to 9 do
            begin
              for column := 4 to 6 do
                begin
                  if sudokuarray[row,column] = number then
                    IsValid := false
                end;
            end;
         end
      else if (index2 >= 7) and (index2 <= 9) then
        begin
          for row := 7 to 9 do
            begin
              for column := 7 to 9 do
                begin
                  if sudokuarray[row,column] = number then
                    IsValid := false
                end;
            end;
         end;
    end;
end;


procedure TForm1.ButtonClick(Sender: TObject);
var
  index, index2 : integer;
begin
  for index := 1 to 9 do
    begin
      for index2 := 1 to 9 do
        begin
          if sender = sudokubuttonarray[index,index2] then
            begin
              if buttonvalue = 0 then
                begin
                  sudokubuttonarray[index,index2].caption := '';
                  sudokuarray[index, index2] := buttonvalue;
                end
              else
                begin
                  sudokubuttonarray[index,index2].caption := IntToStr(buttonvalue);
                  sudokuarray[index, index2] := buttonvalue;
                end;
            end;
        end;
    end;
end;

procedure TForm1.Value1Click(Sender: TObject);
begin
  buttonvalue := 1;
end;

procedure TForm1.Value2Click(Sender: TObject);
begin
  buttonvalue := 2;
end;

procedure TForm1.Value3Click(Sender: TObject);
begin
  buttonvalue := 3;
end;

procedure TForm1.Value4Click(Sender: TObject);
begin
  buttonvalue := 4;
end;

procedure TForm1.Value5Click(Sender: TObject);
begin
  buttonvalue := 5;
end;

procedure TForm1.Value6Click(Sender: TObject);
begin
  buttonvalue := 6;
end;

procedure TForm1.Value7Click(Sender: TObject);
begin
  buttonvalue := 7;
end;

procedure TForm1.Value8Click(Sender: TObject);
begin
  buttonvalue := 8;
end;

procedure TForm1.Value9Click(Sender: TObject);
begin
  buttonvalue := 9;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  index, index2 : integer;
begin
  buttonvalue := 1;
  for index := 1 to 9 do
    begin
      for index2 := 1 to 9 do
        begin
          sudokubuttonarray[index,index2] := TButton.Create(self);
          sudokubuttonarray[index,index2].Parent := self;
          sudokubuttonarray[index,index2].Width := 45;
          sudokubuttonarray[index,index2].Height := 45;
          sudokubuttonarray[index,index2].Font.Size := 15;
          sudokubuttonarray[index,index2].Font.Name := 'Myriad Web';
          sudokubuttonarray[index,index2].Visible := true;
          sudokubuttonarray[index,index2].Top := 20 + (49 * index);
          sudokubuttonarray[index,index2].left := 20 + (49 * index2);
          sudokubuttonarray[index,index2].onclick := buttonclick;
          sudokuarray[index,index2] := 0;
        end;
    end;
end;

procedure TForm1.SolveClick(Sender: TObject);
var
  // Logic Solving Part Variables
  index,index2,index3,index4 : integer;
  blankAmount : integer;
  numberCheckAmount : integer;
  cycleamount : integer;
  number,number2,number3,number4 : integer;
  numbercheck,numbercheck2 : integer;
  possible : boolean;
begin
  //Logic Solving Part
  numbercheckamount := 0;
  for cycleamount := 1 to 30 do
    begin
      for number := 1 to 9 do
        begin
          for index := 1 to 3 do
            begin
              for index2 := 1 to 3 do
                begin
                  if IsValid(number, index, index2) = true then
                    Inc(numbercheckamount);
                end;
            end;
          if numbercheckamount = 1 then
            begin
              for index := 1 to 3 do
                begin
                  for index2 := 1 to 3 do
                   if IsValid(number,index,index2) = true then
                     begin
                      sudokubuttonarray[index,index2].caption := IntToStr(number);
                      sudokuarray[index,index2] := number;
                    end;
                end;
            end;
          numbercheckamount := 0;

          for index := 1 to 3 do
            begin
              for index2 := 4 to 6 do
                begin
                  if IsValid(number, index, index2) = true then
                    Inc(numbercheckamount);
                end;
            end;
          if numbercheckamount = 1 then
            begin
              for index := 1 to 3 do
                begin
                  for index2 := 4 to 6 do
                   if IsValid(number,index,index2) = true then
                     begin
                      sudokubuttonarray[index,index2].caption := IntToStr(number);
                      sudokuarray[index,index2] := number;
                    end;
                end;
            end;
          numbercheckamount := 0;

          for index := 1 to 3 do
            begin
              for index2 := 7 to 9 do
                begin
                  if IsValid(number, index, index2) = true then
                    Inc(numbercheckamount);
                end;
            end;
          if numbercheckamount = 1 then
            begin
              for index := 1 to 3 do
                begin
                  for index2 := 7 to 9 do
                   if IsValid(number,index,index2) = true then
                     begin
                      sudokubuttonarray[index,index2].caption := IntToStr(number);
                      sudokuarray[index,index2] := number;
                    end;
                end;
            end;
          numbercheckamount := 0;

          for index := 4 to 6 do
            begin
              for index2 := 1 to 3 do
                begin
                  if IsValid(number, index, index2) = true then
                    Inc(numbercheckamount);
                end;
            end;
          if numbercheckamount = 1 then
            begin
              for index := 4 to 6 do
                begin
                  for index2 := 1 to 3 do
                   if IsValid(number,index,index2) = true then
                     begin
                      sudokubuttonarray[index,index2].caption := IntToStr(number);
                      sudokuarray[index,index2] := number;
                    end;
                end;
            end;
          numbercheckamount := 0;

          for index := 4 to 6 do
            begin
              for index2 := 4 to 6 do
                begin
                  if IsValid(number, index, index2) = true then
                    Inc(numbercheckamount);
                end;
            end;
          if numbercheckamount = 1 then
            begin
              for index := 4 to 6 do
                begin
                  for index2 := 4 to 6 do
                   if IsValid(number,index,index2) = true then
                     begin
                      sudokubuttonarray[index,index2].caption := IntToStr(number);
                      sudokuarray[index,index2] := number;
                    end;
                end;
            end;
          numbercheckamount := 0;

          for index := 4 to 6 do
            begin
              for index2 := 7 to 9 do
                begin
                  if IsValid(number, index, index2) = true then
                    Inc(numbercheckamount);
                end;
            end;
          if numbercheckamount = 1 then
            begin
              for index := 4 to 6 do
                begin
                  for index2 := 7 to 9 do
                   if IsValid(number,index,index2) = true then
                     begin
                      sudokubuttonarray[index,index2].caption := IntToStr(number);
                      sudokuarray[index,index2] := number;
                    end;
                end;
            end;
          numbercheckamount := 0;

          for index := 7 to 9 do
            begin
              for index2 := 1 to 3 do
                begin
                  if IsValid(number, index, index2) = true then
                    Inc(numbercheckamount);
                end;
            end;
          if numbercheckamount = 1 then
            begin
              for index := 7 to 9 do
                begin
                  for index2 := 1 to 3 do
                   if IsValid(number,index,index2) = true then
                     begin
                      sudokubuttonarray[index,index2].caption := IntToStr(number);
                      sudokuarray[index,index2] := number;
                    end;
                end;
            end;
          numbercheckamount := 0;

          for index := 7 to 9 do
            begin
              for index2 := 4 to 6 do
                begin
                  if IsValid(number, index, index2) = true then
                    Inc(numbercheckamount);
                end;
            end;
          if numbercheckamount = 1 then
            begin
              for index := 7 to 9 do
                begin
                  for index2 := 4 to 6 do
                   if IsValid(number,index,index2) = true then
                     begin
                      sudokubuttonarray[index,index2].caption := IntToStr(number);
                      sudokuarray[index,index2] := number;
                    end;
                end;
            end;
          numbercheckamount := 0;

          for index := 7 to 9 do
            begin
              for index2 := 7 to 9 do
                begin
                  if IsValid(number, index, index2) = true then
                    Inc(numbercheckamount);
                end;
            end;
          if numbercheckamount = 1 then
            begin
              for index := 7 to 9 do
                begin
                  for index2 := 7 to 9 do
                   if IsValid(number,index,index2) = true then
                     begin
                      sudokubuttonarray[index,index2].caption := IntToStr(number);
                      sudokuarray[index,index2] := number;
                    end;
                end;
            end;
          numbercheckamount := 0;

          for index := 1 to 9 do
            begin
              blankamount := 0;
              possible := false;
              for index2 := 1 to 9 do
                begin
                  if sudokuarray[index,index2] = 0 then
                    begin
                      Inc(blankamount);
                    end;
                end;
              if blankAmount = 1 then
                begin
                  for index3 := 1 to 9 do
                    begin
                      if IsValid(number, index, index3) = true then
                        begin
                          sudokuarray[index,index3] := number;
                          sudokubuttonarray[index,index3].Caption := IntToStr(number);
                        end;
                    end;
                end
              else if blankamount = 2 then
                begin
                  for number2 := 1 to 9 do
                    begin
                      for index2 := 1 to 9 do
                        begin
                          if (IsValid(number2,index,index2) = false) and (sudokuarray[index,index2] = 0) and (IsNumberInRow(number2,index) = false) then
                            begin
                              for number3 := 1 to 9 do
                                begin
                                  if IsValid(number3, index, index2) = true then
                                    begin
                                      for index3 := 1 to 9 do
                                        begin
                                          for number4 := 1 to number3-1 do
                                            begin
                                              if IsValid(number4, index, index3) = true then
                                                possible := true;
                                            end;
                                          for number4 := number3+1 to 9 do
                                            begin
                                              if IsValid(number4, index, index3) = true then
                                                possible := true;
                                            end;
                                        end;
                                      if (possible = true) then
                                        begin
                                          sudokubuttonarray[index,index2].caption := IntToStr(number3);
                                          sudokuarray[index,index2] := number3;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
          blankamount := 0;

          for index := 1 to 9 do
            begin
              blankamount := 0;
              for index2 := 1 to 9 do
                begin
                  if sudokuarray[index2,index] = 0 then
                    Inc(blankamount);
                end;
              if blankAmount = 1 then
                begin
                  for index2 := 1 to 9 do
                    begin
                      if IsValid(number, index2, index) = true then
                        begin
                          sudokuarray[index2,index] := number;
                          sudokubuttonarray[index2,index].Caption := IntToStr(number);
                        end;
                    end;
                end
              else if blankamount = 2 then
                begin
                  for number2 := 1 to 9 do
                    begin
                      for index2 := 1 to 9 do
                        begin
                          if (IsValid(number2,index2,index) = false) and (sudokuarray[index2,index] = 0) and (IsNumberInColumn(number2,index) = false) then
                            begin
                              for number3 := 1 to 9 do
                                begin
                                  if IsValid(number3, index2, index) = true then
                                    begin
                                      for index3 := 1 to 9 do
                                        begin
                                          for number4 := 1 to number3-1 do
                                            begin
                                              if IsValid(number4, index3, index) = true then
                                                possible := true;
                                            end;
                                          for number4 := number3+1 to 9 do
                                            begin
                                              if IsValid(number4, index3, index) = true then
                                                possible := true;
                                            end;
                                        end;
                                      if possible = true then
                                        begin
                                          sudokubuttonarray[index2,index].caption := IntToStr(number3);
                                          sudokuarray[index2,index] := number3;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
          blankamount := 0;
        end;
    end;
end;

procedure TForm1.ClearClick(Sender: TObject);
var
  index, index2 : integer;
begin
  for index := 1 to 9 do
    begin
      for index2 := 1 to 9 do
        begin
          sudokubuttonarray[index,index2].caption := '';
          sudokuarray[index,index2] := 0;
        end;
     end;
end;

procedure TForm1.EraseClick(Sender: TObject);
begin
  buttonvalue := 0;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  //haxarray : array [1..9,1..9] of integer;
  index1,index2 : integer;
begin
  //for index1 := 1 to 9 do
  //  begin
  //    for index2 := 1 to 9 do
   //     begin
   //       haxarray[index1,index2] := sudokuarray[index1,index2];
  //      end;
    //end;
    RecursiveSolve(1, 1);
  for index1 := 1 to 9 do
    begin
      for index2 := 1 to 9 do
        begin
          sudokubuttonarray[index1,index2].Caption := inttostr(sudokuarray[index1,index2]);
        end;
    end;
end;

end.
