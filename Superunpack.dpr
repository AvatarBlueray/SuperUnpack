program Superunpack;

uses
  windows,
  classes,
  Dialogs ,
  SysUtils,
  DSiWin32 in 'DSiWin32.pas';

var i:Integer;


procedure capture_output (command:string; output:TStringList; dir:string);
var
  exitCode: longword;
begin
    if DSiExecuteAndCapture(command, output, dir, exitCode) = 0 then
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
        end;
end;

procedure extract_subfolder(s:string);
var
  output  : TStringList;
  sub:string;
//  i:Integer;
begin

sub:= StringReplace(ExtractFileName(s),ExtractFileExt(s),'',[rfReplaceAll, rfIgnoreCase]);
  output := TStringList.Create;
      try
                capture_output ('7z x -o'+sub +' "' +s+'"', output,ExtractFilePath(s));
//                    for i:=0 to output.Count -1 do
//                        form1.Memo1.Lines.Add(output.Strings[i]);

      finally FreeAndNil(output); end;
end;


procedure extract_here(s:string);
var
  output  : TStringList;
//  i:Integer;
begin
  output := TStringList.Create;
      try
                capture_output ('7z x "' +s+'"', output,ExtractFilePath(s));
//                    for i:=0 to output.Count -1 do
//                        form1.Memo1.Lines.Add(output.Strings[i]);

      finally FreeAndNil(output); end;
end;

function get_line(s:string):string;
var
  i:Integer;
  space:Boolean;
  space_count:Integer;

begin
  space_count:=0;
  space:=False;
  for i:=1 to StrLen(PAnsiChar(s)) do
  begin
  if ( s[i] = ' ' ) and ( not space  )then
   space_count:=space_count+1;
      space:=s[i] = ' ';

      if (not space) and (space_count = 5) then
        Break;


  end;

  Result:= copy (s,i,StrLen(PAnsiChar(s)) - i+1);

end;
procedure SuperUnpack2(s:string);
  var
  output  : TStringList;
  out2:TStringList;
  i:Integer;
  flag:Boolean;
begin
  flag:=False;
     output := TStringList.Create;
     out2:= TStringList.Create;

  try
//    form1.Memo1.Lines.Clear;
    capture_output ('7z l "'+s +'"', output,ExtractFilePath(s));
    for i:=0 to output.Count -1 do
    begin
          // ShowMessage(output.Strings[i] );

      if output.Strings[i] = '------------------- ----- ------------ ------------  ------------------------' then
        flag:=not flag
      else
        if flag then
        begin
              out2.Add(get_line(output.Strings[i])) ;
//              form1.Memo1.Lines.Add(get_line(output.Strings[i]));
        end;

    end;
    
    if detect_folder(out2) then

      extract_here(s)
     else
         extract_subfolder(s);

  finally
      FreeAndNil(output);
      FreeAndNil(out2);
   end;



end;

begin
for i := 0 to ParamCount do
 if i = 1 then
 begin

//  ShowMessage(ParamStr(i));
   superunpack2(ParamStr(i));
   end;
end.