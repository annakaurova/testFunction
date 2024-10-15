object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1055#1088#1080#1084#1077#1088' '#1087#1077#1088#1077#1082#1083#1102#1095#1077#1085#1080#1103' '#1103#1079#1099#1082#1072
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 35
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 8
    Top = 91
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 628
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 1
    ExplicitWidth = 624
  end
  object Edit1: TEdit
    Left = 8
    Top = 56
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'Edit1'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 423
    Width = 628
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitTop = 422
    ExplicitWidth = 624
  end
  object BtnClose: TButton
    Left = 545
    Top = 392
    Width = 75
    Height = 25
    Hint = #1042#1099#1093#1086#1076'|'#1047#1072#1074#1077#1088#1096#1077#1085#1080#1077' '#1088#1072#1073#1086#1090#1099' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 160
    Width = 353
    Height = 23
    TabOrder = 5
    Text = 'ComboBox1'
  end
  object MainMenu1: TMainMenu
    Left = 568
    Top = 56
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1071#1079#1099#1082
      object N4: TMenuItem
        Caption = #1056#1091#1089#1089#1082#1080#1081
        Checked = True
        GroupIndex = 10
        RadioItem = True
      end
      object N5: TMenuItem
        Caption = #1040#1085#1075#1083#1080#1081#1089#1082#1080#1081
        GroupIndex = 10
        RadioItem = True
      end
    end
  end
end
