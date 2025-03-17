object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object edUserName: TLabeledEdit
    Left = 32
    Top = 48
    Width = 121
    Height = 23
    EditLabel.Width = 58
    EditLabel.Height = 15
    EditLabel.Caption = 'User Name'
    TabOrder = 0
    Text = ''
  end
  object edPass: TLabeledEdit
    Left = 184
    Top = 48
    Width = 121
    Height = 23
    EditLabel.Width = 50
    EditLabel.Height = 15
    EditLabel.Caption = 'Password'
    TabOrder = 1
    Text = ''
  end
  object btnLogon: TButton
    Left = 328
    Top = 47
    Width = 75
    Height = 25
    Caption = 'Log on'
    TabOrder = 2
    OnClick = btnLogonClick
  end
  object edJwt: TLabeledEdit
    Left = 32
    Top = 104
    Width = 569
    Height = 23
    EditLabel.Width = 17
    EditLabel.Height = 15
    EditLabel.Caption = 'Jwt'
    TabOrder = 3
    Text = ''
  end
  object btnGetArchers: TButton
    Left = 32
    Top = 144
    Width = 75
    Height = 25
    Caption = 'GetArchers'
    TabOrder = 4
    OnClick = btnGetArchersClick
  end
  object mmoArchers: TMemo
    Left = 120
    Top = 145
    Width = 185
    Height = 89
    Lines.Strings = (
      'mmoArchers')
    TabOrder = 5
  end
  object btnGetResults: TButton
    Left = 319
    Top = 144
    Width = 75
    Height = 25
    Caption = 'GetResults'
    TabOrder = 6
    OnClick = btnGetResultsClick
  end
  object mmoResults: TMemo
    Left = 400
    Top = 145
    Width = 185
    Height = 89
    Lines.Strings = (
      'mmoResults')
    TabOrder = 7
  end
  object btnCreateXlsx: TButton
    Left = 32
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Create report'
    TabOrder = 8
    OnClick = btnCreateXlsxClick
  end
  object odXlsx: TOpenDialog
    Filter = 'Template file (*.template.xlsx)|*.Template.xlsx'
    Title = 'Open template file'
    Left = 168
    Top = 248
  end
  object sdReport: TSaveDialog
    DefaultExt = '.xlsx'
    Filter = 'Excel file (*.xlsx)|*.xlsx|Pdf fil (*.pdf)|*.pdf'
    Left = 248
    Top = 256
  end
end
