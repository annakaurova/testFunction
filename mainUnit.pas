unit mainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.StdActns, IniFiles, ThreadsUnit;

type
  TmainForm = class(TForm)
    Button1: TButton;
    ToolBar1: TToolBar;
    LbAmountComponents: TLabel;
    EditAmountComponents: TEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    StatusBar1: TStatusBar;
    BtnClose: TButton;
    ComboBox1: TComboBox;
    ActionList1: TActionList;
    OpenFile: TAction;
    WindowClose: TWindowClose;
    OpenDialog1: TOpenDialog;
    BtnOpenFiles: TButton;
    Edit2: TMenuItem;
    LbSystemFonts: TLabel;
    N7: TMenuItem;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure OpenFileExecute(Sender: TObject);
    procedure WindowCloseExecute(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);

  private
    { Private declarations }
  public
    procedure LongTextHint(Sender: TObject);

    procedure ChangeLang(LangSection: string);

  end;

var
  mainForm: TmainForm;

implementation

{$R *.dfm}

procedure TmainForm.LongTextHint(Sender: TObject);
begin
  StatusBar1.SimpleText := GetLongHint(Application.Hint);
end;

procedure TmainForm.N4Click(Sender: TObject);
begin
mainForm.ChangeLang('RUSSIAN');
N4.Checked := true;
end;

procedure TmainForm.N5Click(Sender: TObject);
begin
mainForm.ChangeLang('ENGLISH');
N5.Checked := true;
end;

procedure TmainForm.N7Click(Sender: TObject);
var
x:integer;
begin
// Запуск окна тестирования потоков
ThreadsForm.Show;
x:=0;
repeat
   self.ProgressBar1.Position := x;
   Inc(x);
   sleep(50);
   Application.ProcessMessages;
   if x = 100 then
    x := 0;
until x>100;

end;

procedure TmainForm.FormCreate(Sender: TObject);
begin
  Application.OnHint := LongTextHint;
  ComboBox1.Items := Screen.Fonts;
  ComboBox1.ItemIndex := 0;
//  ShowMessageFmt('%s сообщение %s',['Это','отформатированное!']);
//  ActionList1.ActionCount
end;

procedure TmainForm.Button1Click(Sender: TObject);
begin
EditAmountComponents.Text := IntToStr(mainForm.ComponentCount);
end;


procedure TmainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{ выставить KeyPreview = true}
  if ssCtrl in Shift then {если нажата клавиша Ctrl}
  case Key of
    VK_UP : mainForm.Top:=mainForm.Top-1;
    VK_DOWN : mainForm.Top:=mainForm.Top+1;
    VK_LEFT : mainForm.Left:=mainForm.Left-1;
    VK_RIGHT : mainForm.Left:=mainForm.Left+1;
  end;
end;

procedure TmainForm.OpenFileExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
     //...
  end;
end;

procedure TmainForm.ChangeLang(LangSection: string);
var
  // временная числовая переменная для выборки всех компонентов
  i: Integer;
  LangIniFile: TMemIniFile;
  // строковая переменная для получения каталога, где находится запущенный EXE файл
  ProgramPath: string;
begin
  // если в окне больше одного компонента
  if ComponentCount <> 0 then
  begin
    // получаем каталог, где лежит запущенный EXE файл
    ProgramPath := ExtractFileDir(Application.ExeName);
    // гарантированно устанавливаем последний символ '\' в конце строки
    if ProgramPath[Length(ProgramPath)] <> '\' then
      ProgramPath := ProgramPath + '\';
    // подготавливаем INI файл. Он должен иметь название lang.ini
    // и должен находиться в каталоге программы
    LangIniFile:= TMemIniFile.Create(ProgramPath+'lang\lang.ini', TEncoding.UTF8);
    // читаем заголовок окна
    Caption:=LangIniFile.ReadString(LangSection,name,Caption);
    // перебираем все компоненты в этом окне
    for i:=1 to ComponentCount do
    begin
      // если выбран из массива компонент Button, то изменяем текст на кнопке
      if Components[i-1].ClassType = TButton then
        begin
        (Components[i-1] as TButton).Caption := LangIniFile.ReadString(LangSection,
        name+Components[i-1].name, (Components[i-1] as TButton).Caption);
        (Components[i-1] as TButton).Hint := LangIniFile.ReadString(LangSection,
        name+Components[i-1].name+'Hint', (Components[i-1] as TButton).Hint);
        end;
      // аналогично для других типов:
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

    end;

    // если в приложении есть компоненты форм (не консольное приложение)
    if Application.ComponentCount <> 0 then
      // перебираем все компоненты
      for i := 1 to Application.ComponentCount do
        // если выбранный компонент является подклассом окна, то
        if Application.Components[i-1].ClassParent = TForm then
        begin
          // обработка переключения языка для этого окна
          (Application.Components[i-1] as TForm).Caption := LangIniFile.ReadString(LangSection,
        Application.Components[i-1].name, (Application.Components[i-1] as TForm).Caption);
        end;

    LangIniFile.Free;
  end;
end;

procedure TmainForm.WindowCloseExecute(Sender: TObject);
begin
self.Close;
end;

end.
