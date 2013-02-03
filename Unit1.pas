unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DSiWin32;

type
  TForm1 = class(TForm)
    btn1: TButton;
    Memo1: TMemo;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure capture_output (command:string; output:TStringList);
var
  exitCode: longword;
begin
    if DSiExecuteAndCapture(command, output, '', exitCode) = 0 then
     ShowMessage('Cannot start');

end;

function detect_single_line(s:string):string;
var
  posi:Integer;
begin
  posi:= Pos('\',s);
  if posi <> 0 then
     result:=Copy(s,1,posi-1)
   else
    Result:= s;

end;

function  detect_folder(output:TStringList):Boolean;
var
temp1 : string;
temp2: string;
i:Integer;

begin
  result:=True;
  if output.Count > 1 then
        for i:=0 to output.Count - 1 do
        begin
          temp2:=  detect_single_line (output.Strings[i]);
          if temp1 = '' then
           temp1:=temp2;
           if temp2 <> temp1 then
           begin
             result:= False;
             Break;
           end;
        end
    else
    result:=False;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  exitCode: longword;
  output  : TStringList;
  i:Integer;
begin
  output := TStringList.Create;
  try
    form1.Memo1.Lines.Clear;
    capture_output ('unrar vb 1.rar', output);
    for i:=0 to output.Count -1 do
    form1.Memo1.Lines.Add(output.Strings[i]);

    if detect_folder(output) then
     ShowMessage('sub')
     else
      ShowMessage('single');

  finally FreeAndNil(output); end;
end;

end.
