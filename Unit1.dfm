object mainForm: TmainForm
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
  object LbAmountComponents: TLabel
    Left = 8
    Top = 35
    Width = 142
    Height = 15
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1086#1074
  end
  object LbSystemFonts: TLabel
    Left = 8
    Top = 373
    Width = 99
    Height = 15
    Caption = #1064#1088#1080#1092#1090#1099' '#1089#1080#1089#1090#1077#1084#1099
  end
  object Button1: TButton
    Left = 8
    Top = 91
    Width = 121
    Height = 25
    Hint = #1050#1086#1084#1087#1086#1085#1077#1085#1090#1099'|'#1054#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1076#1086#1095#1077#1088#1085#1080#1093' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1086#1074
    Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090#1099
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
  end
  object EditAmountComponents: TEdit
    Left = 8
    Top = 56
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 423
    Width = 628
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object BtnClose: TButton
    Left = 496
    Top = 392
    Width = 124
    Height = 25
    Hint = 'Close'
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 4
    OnClick = WindowCloseExecute
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 394
    Width = 353
    Height = 23
    Hint = #1064#1088#1080#1092#1090#1099' '#1089#1080#1089#1090#1077#1084#1099'|'#1057#1087#1080#1089#1086#1082' '#1074#1089#1077#1093' '#1089#1080#1089#1090#1077#1084#1085#1099#1093' '#1096#1088#1080#1092#1090#1086#1074
    TabOrder = 5
  end
  object BtnOpenFiles: TButton
    Left = 8
    Top = 296
    Width = 121
    Height = 25
    Action = OpenFile
    TabOrder = 6
  end
  object MainMenu1: TMainMenu
    Left = 568
    Top = 56
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N6: TMenuItem
        Action = OpenFile
      end
      object N2: TMenuItem
        Action = WindowClose
      end
    end
    object Edit2: TMenuItem
      Caption = 'Edit'
    end
    object N3: TMenuItem
      Caption = #1071#1079#1099#1082
      object N4: TMenuItem
        Caption = #1056#1091#1089#1089#1082#1080#1081
        Checked = True
        GroupIndex = 10
        RadioItem = True
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1040#1085#1075#1083#1080#1081#1089#1082#1080#1081
        GroupIndex = 10
        RadioItem = True
        OnClick = N5Click
      end
    end
  end
  object ActionList1: TActionList
    Left = 568
    Top = 160
    object OpenFile: TAction
      Category = 'Window'
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      OnExecute = OpenFileExecute
    end
    object WindowClose: TWindowClose
      Category = 'Window'
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = 'Close'
      ShortCut = 16472
      OnExecute = WindowCloseExecute
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 568
    Top = 104
  end
end
