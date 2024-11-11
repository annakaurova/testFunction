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
// если в приложении есть компоненты форм (не консольное приложение)
    if App.ComponentCount <> 0 then
      begin
           // получаем каталог, где лежит запущенный EXE файл
             ProgramPath := ExtractFileDir(Application.ExeName);
          // гарантированно устанавливаем последний символ '\' в конце строки
             if ProgramPath[Length(ProgramPath)] <> '\' then
               ProgramPath := ProgramPath + '\';
          // подготавливаем INI файл. Он должен иметь название lang.ini
          // и должен находиться в каталоге программы
          LangIniFile:= TMemIniFile.Create(ProgramPath+NameIniFile, TEncoding.UTF8);
          // перебираем все компоненты
            for j := 1 to App.ComponentCount do
              // если выбранный компонент является подклассом окна, то
              if App.Components[j-1].ClassParent = TForm then
              begin
                // обработка переключения языка для этого окна
                (App.Components[j-1] as TForm).Caption := LangIniFile.ReadString(LangSection,
              App.Components[j-1].name, (Application.Components[j-1] as TForm).Caption);


              with Form do
               for i:=1 to ComponentCount do
                 if ComponentCount <> 0 then
                  begin
                    // если выбран из массива компонент Button, то изменяем текст на кнопке
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
//  // временная числовая переменная для выборки всех компонентов
//  i: Integer;
//  LangIniFile: TMemIniFile;
//
//    // строковая переменная для получения каталога, где находится запущенный EXE файл
//  ProgramPath: string;
//begin
//  // если в окне больше одного компонента
//  if ComponentCount <> 0 then
//  begin
//    // получаем каталог, где лежит запущенный EXE файл
//    ProgramPath := ExtractFileDir(Application.ExeName);
//    // гарантированно устанавливаем последний символ '\' в конце строки
//    if ProgramPath[Length(ProgramPath)] <> '\' then
//      ProgramPath := ProgramPath + '\';
//    // подготавливаем INI файл. Он должен иметь название lang.ini
//    // и должен находиться в каталоге программы
//    LangIniFile:= TMemIniFile.Create(ProgramPath+NameIniFile, TEncoding.UTF8);
//    // читаем заголовок окна
//    form3.Caption:=LangIniFile.ReadString(LangSection,Screen.ActiveForm.name,Screen.ActiveForm.Caption);
//    // перебираем все компоненты в этом окне
//    for i:=1 to ComponentCount do
//    begin
//      // если выбран из массива компонент Button, то изменяем текст на кнопке
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
