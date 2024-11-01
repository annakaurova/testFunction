unit ThreadsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TThreadsForm = class(TForm)
    BtThreadsStart: TButton;
    Memo1: TMemo;
    procedure BtThreadsStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  //класс потока
  TTestThread=class(tthread)
  private
    s: string;
    procedure addstr;
  protected
    procedure execute; override;
  end;


var
  ThreadsForm: TThreadsForm;
  oneMoreThread, ProgressBarThread: TTestThread;

implementation

{$R *.dfm}

procedure TTestThread.execute;
var
  code:LongInt;
begin
  inherited;
//  synchronize(addstr); // Вызов метода с синхронизацией
  self.addstr;
//  synchronize(progress);
end;


procedure TThreadsForm.BtThreadsStartClick(Sender: TObject);
begin
oneMoreThread := TTestThread.Create(true); // <<true означает ручной запуск потока
oneMoreThread.FreeOnTerminate := true; // <<Экземпляр должен само уничтожиться после выполнения
oneMoreThread.s := '1 thread';
oneMoreThread.Priority:=tpNormal; // <<Выставляем приоритет потока
oneMoreThread.resume;

end;

procedure TTestThread.addstr;
begin
  ThreadsForm.memo1.lines.add(s);

  sleep(500);
  ThreadsForm.memo1.lines.add(s);

  sleep(500);
  ThreadsForm.memo1.lines.add(s);

  sleep(500);
  ThreadsForm.memo1.lines.add(s);

  sleep(500);
  ThreadsForm.memo1.lines.add(s);
end;

end.
