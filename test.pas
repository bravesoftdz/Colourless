unit test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;
const
  R = 40;
  N = 12;
type
  TStatus = (stBlue, stRed, stBlack);
  TPeak = record
    x,y:integer;
    status:TStatus;
  end;
  TPeakList = array[1..N] of TPeak;
  TForm1 = class(TForm)
    Image1: TImage;
    pnlSidebar: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonRestartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
Level1:array[1..2, 1..12] of integer = ((180,300,420,300,60,180,300,420,540,420,300,180),(110,40,110,200,400,320,320,320,400,500,500,500));
var
  Form1: TForm1;
  PeakList:TPeakList;
  x0,y0:integer;

implementation

{$R *.dfm}

procedure TForm1.ButtonRestartClick(Sender: TObject);
var i:integer;
begin
for i := 1 to N do
  begin
  PeakList[i].status :=stBlue;
  x0:= PeakList[i].x;
  y0:= PeakList[i].y;
  Image1.Canvas.Ellipse(x0-R,Y0-R,X0+R,Y0+R)
  end;
button2.Visible:=False;
end;

Procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.MoveTo(X0,Y0);
  Image1.Canvas.Pen.Width := 10;
  Image1.Canvas.LineTo(x0+100, y0+100);
  Image1.Canvas.LineTo(x0+200, y0);
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.Brush.Color := clBlue;
  Image1.Canvas.Ellipse(x0-R,Y0-R,X0+R,Y0+R);
  Image1.Canvas.Ellipse(x0+200-R,Y0-R,X0+200+R,Y0+R);
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var i:integer;
begin
    //ShowMessage(IntToStr(x) + ' ' + IntToStr(y));
    if  Button=mbLeft then
      begin
      Image1.Canvas.Brush.Color := clRed;
      for i:=1 to N do
        begin
        if (PeakList[i].x-x)*(PeakList[i].x-x) + (PeakList[i].y-y)*(PeakList[i].y-y) <= R*R then
          begin
          x0:= PeakList[i].x;
          y0:= PeakList[i].y;
          PeakList[i].status :=stRed;
          end;
        end;
      end
    else if Button=mbRight then
      begin
      Image1.Canvas.Brush.Color := clBlack;
      for i:=1 to N do
        begin
        if (PeakList[i].x-x)*(PeakList[i].x-x) + (PeakList[i].y-y)*(PeakList[i].y-y) <= R*R then
          begin
          x0:= PeakList[i].x;
          y0:= PeakList[i].y;
          PeakList[i].status :=stBlack;
          end;
        end;
      end;
    Image1.Canvas.Ellipse(x0-R,Y0-R,X0+R,Y0+R);

end;

end.
