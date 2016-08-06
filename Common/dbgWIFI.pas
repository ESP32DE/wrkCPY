unit dbgWIFI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SimpleTCP, Menus, StdCtrls, ComCtrls;

type
  TdbgTCPUDP = class(TForm)
    MainMenu1: TMainMenu;
    ESP82661: TMenuItem;
    ESP321: TMenuItem;
    Net1: TMenuItem;
    SimpleTCPServer1: TSimpleTCPServer;
    SimpleTCPClient1: TSimpleTCPClient;
    redbg: TRichEdit;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnSendCmd: TButton;
    procedure SimpleTCPClient1Read(Sender: TObject; Stream: TStream);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnSendCmdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dbgTCPUDP: TdbgTCPUDP;

implementation

{$R *.dfm}

procedure TdbgTCPUDP.SimpleTCPClient1Read(Sender: TObject;
  Stream: TStream);
var
  St: String;

begin
  // Log(Sender, 'Data received from socket ' + IntToStr(Client.Socket) + ' (' + Client.Host + ')');
  with Stream as TMemoryStream do
   begin
    SetLength(St, Size);
    Read(St[1], Size);
   end;
   redbg.Lines.Add(St);
  // ServerOutput.Lines.Add(St);

end;

procedure TdbgTCPUDP.CheckBox1Click(Sender: TObject);
begin
SimpleTCPClient1.Host := edit1.Text;
SimpleTCPClient1.Port := strtoint(Edit2.Text);
SimpleTCPClient1.Connected := CheckBox1.Checked;
end;

procedure TdbgTCPUDP.btnSendCmdClick(Sender: TObject);

var
buff : PAnsiChar;
begin
buff := 'adc';
SimpleTCPClient1.Send(buff,length(buff));

end;

end.
