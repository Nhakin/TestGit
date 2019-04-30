unit AboutFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, SpTBXItem, SpTBXControls;

type
  TAboutDlg = class(TForm)
    SpTBXTitleBar1: TSpTBXTitleBar;
    Image1: TImage;
    Label1: TSpTBXLabel;

  end;

var
  AboutDlg: TAboutDlg;

implementation

Uses SpTBXSkins, SpTbxAdditionalSkins;

{$R *.dfm}

end.
