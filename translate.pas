unit translate;


interface
uses
  System.SysUtils, System.Classes, Vcl.Forms,  Windows, Messages, Variants, Graphics, Controls,
  Dialogs, StdCtrls,IniFiles, Menus;
 //procedure ChangeLang(LangSection: string;NameIniFile:string; form3:Tform);
 procedure translateForm (LangSection: string; var  App:TApplication; NameIniFile:string; Form:Tform);


implementation


procedure translateForm (LangSection: string;  var App:TApplication; NameIniFile:string; Form:Tform);
var
 i,j:integer;
 LangIniFile: TMemIniFile;
 ProgramPath: string;


begin
// ���� � ���������� ���� ���������� ���� (�� ���������� ����������)
    if App.ComponentCount <> 0 then
      begin
           // �������� �������, ��� ����� ���������� EXE ����
             ProgramPath := ExtractFileDir(Application.ExeName);
          // �������������� ������������� ��������� ������ '\' � ����� ������
             if ProgramPath[Length(ProgramPath)] <> '\' then
               ProgramPath := ProgramPath + '\';
          // �������������� INI ����. �� ������ ����� �������� lang.ini
          // � ������ ���������� � �������� ���������
          LangIniFile:= TMemIniFile.Create(ProgramPath+NameIniFile, TEncoding.UTF8);
          // ���������� ��� ����������
            for j := 1 to App.ComponentCount do
              // ���� ��������� ��������� �������� ���������� ����, ��
              if App.Components[j-1].ClassParent = TForm then
              begin
                // ��������� ������������ ����� ��� ����� ����
                (App.Components[j-1] as TForm).Caption := LangIniFile.ReadString(LangSection,
              App.Components[j-1].name, (Application.Components[j-1] as TForm).Caption);


              with Form do
               for i:=1 to ComponentCount do
                 if ComponentCount <> 0 then
                  begin
                    // ���� ������ �� ������� ��������� Button, �� �������� ����� �� ������
                   if Components[i-1].ClassType = TButton then
                      begin
                      (Components[i-1] as TButton).Caption := LangIniFile.ReadString(LangSection,
                      name+Components[i-1].name, (Components[i-1] as TButton).Caption);

                      (Components[i-1] as TButton).Hint := LangIniFile.ReadString(LangSection,
                      name+Components[i-1].name+'Hint', (Components[i-1] as TButton).Hint);
                      end;

                   if Components[i-1].ClassType = TLabel then
                      begin
                      (Components[i-1] as TLabel).Caption := LangIniFile.ReadString(LangSection,
                      name+Components[i-1].name, (Components[i-1] as TLabel).Caption);

                      (Components[i-1] as TLabel).Hint := LangIniFile.ReadString(LangSection,
                      name+Components[i-1].name+'Hint', (Components[i-1] as TLabel).Hint);
                      end;
                    if Components[i-1].ClassType = TEdit then
                      begin
                        (Components[i-1] as TEdit).Text := LangIniFile.ReadString(LangSection,
                        name+Components[i-1].name, (Components[i-1] as TEdit).Text);

                        (Components[i-1] as TEdit).Hint := LangIniFile.ReadString(LangSection,
                        name+Components[i-1].name+'Hint', (Components[i-1] as TEdit).Hint);
                      end;

                    if Components[i-1].ClassType = TMenuItem then
                      begin
                        (Components[i-1] as TMenuItem).Caption := LangIniFile.ReadString(LangSection,
                        name+Components[i-1].name, (Components[i-1] as TMenuItem).Caption);

                        (Components[i-1] as TMenuItem).Hint := LangIniFile.ReadString(LangSection,
                        name+Components[i-1].name+'Hint', (Components[i-1] as TMenuItem).Hint);
                      end;

                    if Components[i-1].ClassType = TComboBox then
                      begin
                        (Components[i-1] as TComboBox).Text := LangIniFile.ReadString(LangSection,
                        name+Components[i-1].name, (Components[i-1] as TComboBox).Text);

                        (Components[i-1] as TComboBox).Hint := LangIniFile.ReadString(LangSection,
                        name+Components[i-1].name+'Hint', (Components[i-1] as TComboBox).Hint);
                      end;

                  end;
              end;


      LangIniFile.Free;
      end;
end;



//procedure ChangeLang(LangSection: string; NameIniFile:string; form3:Tform);
//var
//  // ��������� �������� ���������� ��� ������� ���� �����������
//  i: Integer;
//  LangIniFile: TMemIniFile;
//
//    // ��������� ���������� ��� ��������� ��������, ��� ��������� ���������� EXE ����
//  ProgramPath: string;
//begin
//  // ���� � ���� ������ ������ ����������
//  if ComponentCount <> 0 then
//  begin
//    // �������� �������, ��� ����� ���������� EXE ����
//    ProgramPath := ExtractFileDir(Application.ExeName);
//    // �������������� ������������� ��������� ������ '\' � ����� ������
//    if ProgramPath[Length(ProgramPath)] <> '\' then
//      ProgramPath := ProgramPath + '\';
//    // �������������� INI ����. �� ������ ����� �������� lang.ini
//    // � ������ ���������� � �������� ���������
//    LangIniFile:= TMemIniFile.Create(ProgramPath+NameIniFile, TEncoding.UTF8);
//    // ������ ��������� ����
//    form3.Caption:=LangIniFile.ReadString(LangSection,Screen.ActiveForm.name,Screen.ActiveForm.Caption);
//    // ���������� ��� ���������� � ���� ����
//    for i:=1 to ComponentCount do
//    begin
//      // ���� ������ �� ������� ��������� Button, �� �������� ����� �� ������
//      if form3.Components[i-1].ClassType = TButton then
//        begin
//        (Components[i-1] as TButton).Caption := LangIniFile.ReadString(LangSection,
//        name+Components[i-1].name, (Components[i-1] as TButton).Caption);
//        (Components[i-1] as TButton).Hint := LangIniFile.ReadString(LangSection,
//        name+Components[i-1].name+'Hint', (Components[i-1] as TButton).Hint);
//        end;
//
//    end;
//
//
//
//
//  end;
//

end.
