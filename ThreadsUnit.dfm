object ThreadsForm: TThreadsForm
  Left = 0
  Top = 0
  Caption = 'ThreadsForm'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object BtThreadsStart: TButton
    Left = 24
    Top = 40
    Width = 129
    Height = 25
    Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1086#1090#1086#1082
    TabOrder = 0
    OnClick = BtThreadsStartClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 104
    Width = 521
    Height = 225
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
end
