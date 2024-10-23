unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.StdActns, IniFiles;

type
  TmainForm = class(TForm)
    Button1: TButton;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Edit1: TEdit;
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
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure OpenFileExecute(Sender: TObject);
    procedure WindowCloseExecute(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);

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

procedure TmainForm.FormCreate(Sender: TObject);
begin
  Application.OnHint := LongTextHint;
  ComboBox1.Items := Screen.Fonts;
//  ShowMessageFmt('%s сообщение %s',['Это','отформатированное!']);
//  ActionList1.ActionCount
end;

procedure TmainForm.Button1Click(Sender: TObject);
begin
label1.Caption := IntToStr(mainForm.ComponentCount);
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
        (Components[i-1] as TButton).Caption := LangIniFile.ReadString(LangSection,
        name+Components[i-1].name, (Components[i-1] as TButton).Caption);

      // Напомню описание функции ReadString:
      // ====================================
      // LangIniFile.ReadString( СЕКЦИЯ, ПАРАМЕТР, ЗНАЧЕНИЕ_ПО_УМОЛЧАНИЮ );
      // 1. LangSection - передаваемый параметр в процедуру.
      //    В процедуру передается название секции для выбранного языка
      // 2. Name+Components[i-1].Name - Name - название формы,
      //    Components[i-1].Name - название компонента
      // 3. (Components[i-1] as TButton).Caption - в случае неудачного чтения этого
      //    параметра из ini файла (нет такого параметра), то ничего меняться не будет

      // аналогично для других типов:
      if Components[i-1].ClassType = TLabel then
        (Components[i-1] as TLabel).Caption := LangIniFile.ReadString(LangSection,
        name+Components[i-1].name, (Components[i-1] as TLabel).Caption);
      if Components[i-1].ClassType = TEdit then
        (Components[i-1] as TEdit).Text := LangIniFile.ReadString(LangSection,
        name+Components[i-1].name, (Components[i-1] as TEdit).Text);
    // ...
    // ...
    // ...
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
