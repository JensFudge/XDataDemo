object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'TMS XData Server'
  ClientHeight = 242
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  DesignSize = (
    472
    242)
  TextHeight = 13
  object mmInfo: TMemo
    Left = 8
    Top = 40
    Width = 456
    Height = 194
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 0
  end
  object btStart: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = btStartClick
  end
  object btStop: TButton
    Left = 90
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 2
    OnClick = btStopClick
  end
  object Button1: TButton
    Left = 171
    Top = 9
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
end
