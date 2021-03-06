{*******************************************************}
{                                                       }
{       Coloring Graph                                  }
{       The trademark is not registered                 }
{       no rights are protected                         }
{       (c) 2018,  BrakhMen Corp                        }
{       SITE: brakhmen.info                             }
{                                                       }
{*******************************************************}
unit Instructions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    chk1: TCheckBox;
    btnClose: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

uses GraphColoring;
{$R *.dfm}


procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  graphForm.isClose := chk1.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //ShowMessage( IntToStr(graphForm.numOfHelp) );
  if graphForm.numOfHelp = 1 then
    chk1.Visible := False;
end;

end.
