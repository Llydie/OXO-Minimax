object OXOForm: TOXOForm
  Left = 0
  Top = 0
  Caption = 'Noughts and Crosses'
  ClientHeight = 339
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Resultlbl: TLabel
    Left = 48
    Top = 246
    Width = 79
    Height = 25
    Caption = 'Resultlbl'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label1: TLabel
    Left = 270
    Top = 29
    Width = 159
    Height = 16
    Caption = 'Choose Starting Symbol:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 288
    Width = 22
    Height = 23
    Caption = 'O:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 152
    Top = 288
    Width = 20
    Height = 23
    Caption = 'X:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OScore1: TLabel
    Left = 60
    Top = 304
    Width = 17
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object XScore1: TLabel
    Left = 178
    Top = 304
    Width = 17
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 480
    Top = 29
    Width = 163
    Height = 16
    Caption = 'Choose the other player:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CompText: TLabel
    Left = 296
    Top = 200
    Width = 5
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 480
    Top = 192
    Width = 79
    Height = 16
    Caption = 'Who Starts:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OXOGrid: TStringGrid
    Left = 48
    Top = 16
    Width = 216
    Height = 216
    BorderStyle = bsNone
    Color = clBtnFace
    ColCount = 3
    DefaultColWidth = 70
    DefaultRowHeight = 70
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -64
    Font.Name = 'Verdana'
    Font.Style = []
    GridLineWidth = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 0
    OnClick = OXOGridClick
    ColWidths = (
      70
      70
      70)
    RowHeights = (
      70
      70
      70)
  end
  object RG1: TRadioGroup
    Left = 270
    Top = 67
    Width = 185
    Height = 105
    Items.Strings = (
      'Noughts'
      'Crosses')
    TabOrder = 1
    OnClick = RG1Click
  end
  object ContinueButton: TButton
    Left = 304
    Top = 272
    Width = 85
    Height = 25
    Caption = 'ContinueButton'
    TabOrder = 2
    OnClick = ContinueButtonClick
  end
  object RG2: TRadioGroup
    Left = 480
    Top = 67
    Width = 208
    Height = 105
    Items.Strings = (
      'Friend'
      'I have no friends')
    TabOrder = 3
    OnClick = RG2Click
  end
  object RG3: TRadioGroup
    Left = 480
    Top = 217
    Width = 208
    Height = 105
    Items.Strings = (
      'Player 1 (Human)'
      'Player 2 (Computer)')
    TabOrder = 4
    OnClick = RG3Click
  end
  object MainMenu1: TMainMenu
    object Menu1: TMenuItem
      Caption = 'Menu'
      object New1: TMenuItem
        Caption = 'New'
        OnClick = New1Click
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
end
