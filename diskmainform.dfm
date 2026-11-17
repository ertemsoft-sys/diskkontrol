object diskmainformf: Tdiskmainformf
  Left = 0
  Top = 0
  Caption = 'Disk Kontrol'
  ClientHeight = 508
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 15
  object Label22: TLabel
    Left = 208
    Top = 94
    Width = 38
    Height = 17
    Caption = 'Disk 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label23: TLabel
    Left = 208
    Top = 145
    Width = 38
    Height = 17
    Caption = 'Disk 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label24: TLabel
    Left = 208
    Top = 197
    Width = 38
    Height = 17
    Caption = 'Disk 3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label25: TLabel
    Left = 208
    Top = 254
    Width = 38
    Height = 17
    Caption = 'Disk 4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label26: TLabel
    Left = 208
    Top = 318
    Width = 38
    Height = 17
    Caption = 'Disk 5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 489
    Width = 571
    Height = 19
    Panels = <
      item
        Text = 'Copyright '#169' 2026 ErtemSoft  http://www.ertemsoft.net'
        Width = 310
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 571
    Height = 489
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Disk Kontrol'
      object Image1: TImage
        Left = 24
        Top = 80
        Width = 32
        Height = 32
        AutoSize = True
      end
      object Image2: TImage
        Left = 24
        Top = 130
        Width = 32
        Height = 32
        AutoSize = True
      end
      object Image3: TImage
        Left = 24
        Top = 182
        Width = 32
        Height = 32
        AutoSize = True
      end
      object Image4: TImage
        Left = 24
        Top = 240
        Width = 32
        Height = 32
        AutoSize = True
      end
      object Image5: TImage
        Left = 24
        Top = 304
        Width = 32
        Height = 32
        AutoSize = True
      end
      object Label8: TLabel
        Left = 96
        Top = 48
        Width = 27
        Height = 17
        Caption = 'Disk'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 200
        Top = 48
        Width = 52
        Height = 17
        Caption = 'Kapasite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 323
        Top = 48
        Width = 62
        Height = 17
        Caption = 'Kullan'#305'lan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 424
        Top = 48
        Width = 54
        Height = 17
        Caption = 'Bo'#351' Alan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 27
        Top = 70
        Width = 500
        Height = 5
        Shape = bsTopLine
        Style = bsRaised
      end
      object Label12: TLabel
        Left = 96
        Top = 86
        Width = 38
        Height = 17
        Caption = 'Disk 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label13: TLabel
        Left = 96
        Top = 137
        Width = 38
        Height = 17
        Caption = 'Disk 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label14: TLabel
        Left = 96
        Top = 189
        Width = 38
        Height = 17
        Caption = 'Disk 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label15: TLabel
        Left = 96
        Top = 246
        Width = 38
        Height = 17
        Caption = 'Disk 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label16: TLabel
        Left = 96
        Top = 310
        Width = 38
        Height = 17
        Caption = 'Disk 5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label17: TLabel
        Left = 170
        Top = 86
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label18: TLabel
        Left = 170
        Top = 137
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label19: TLabel
        Left = 170
        Top = 189
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label20: TLabel
        Left = 170
        Top = 246
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label21: TLabel
        Left = 170
        Top = 310
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label27: TLabel
        Left = 297
        Top = 86
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label28: TLabel
        Left = 297
        Top = 137
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label29: TLabel
        Left = 297
        Top = 189
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label30: TLabel
        Left = 297
        Top = 246
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label31: TLabel
        Left = 297
        Top = 310
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label32: TLabel
        Left = 440
        Top = 86
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label33: TLabel
        Left = 440
        Top = 135
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label34: TLabel
        Left = 440
        Top = 189
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label35: TLabel
        Left = 440
        Top = 246
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label36: TLabel
        Left = 440
        Top = 310
        Width = 85
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label39: TLabel
        Left = 0
        Top = 0
        Width = 563
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'D'#304'SK KONTROL'
        Color = clGrayText
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        StyleElements = []
        ExplicitWidth = 124
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Log'
      ImageIndex = 2
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 563
        Height = 459
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Log :')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Di'#287'er Yaz'#305'l'#305'mlar'#305'm'#305'z'
      ImageIndex = 3
      object Label41: TLabel
        Left = 160
        Top = 371
        Width = 228
        Height = 25
        Cursor = crHandPoint
        Caption = 'http://www.ertemsoft.net'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Label41Click
      end
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 563
        Height = 345
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        Lines.Strings = (
          'D'#246'k'#252'man Y'#246'netim Sistemi'
          
            'Help Desk Y'#246'netim (Kurumsal destek s'#252're'#231'lerinizi tek platformda ' +
            'y'#246'netin)'
          'Intranet (Caniasla Entegre '#199'al'#305#351'abilir)'
          'Mobile Uygulamalar - Caniasla Entegre Edilebilir'
          'MES '#199#246'z'#252'mleri'
          'Firman'#305'za '#214'zel Yaz'#305'l'#305'm '#199#246'z'#252'mleri'
          'Dijital D'#246'n'#252#351#252'm'
          ''
          'D'#246'k'#252'man Y'#246'netim sistemi ve Help Desk uygulamam'#305'z i'#231'in l'#252'tfen'
          'sitemizi ziyaret ediniz.')
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ayarlar'
      ImageIndex = 1
      object Label1: TLabel
        Left = 24
        Top = 48
        Width = 49
        Height = 17
        Caption = 'Sunucu '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 24
        Top = 92
        Width = 70
        Height = 17
        Caption = 'Mail Server'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 24
        Top = 131
        Width = 53
        Height = 17
        Caption = 'Kullan'#305'c'#305
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 24
        Top = 179
        Width = 59
        Height = 17
        Caption = 'Mail '#350'ifre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 24
        Top = 222
        Width = 63
        Height = 17
        Caption = 'Bilgi Maili'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 24
        Top = 276
        Width = 43
        Height = 17
        Caption = 'Diskler'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 24
        Top = 321
        Width = 67
        Height = 17
        Caption = 'Kontrol GB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label37: TLabel
        Left = 24
        Top = 361
        Width = 87
        Height = 17
        Caption = 'Kontrol S'#252'resi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 200
        Top = 359
        Width = 17
        Height = 17
        Caption = 'Dk'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 0
        Top = 0
        Width = 563
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'PROGRAM AYARLARI'
        Color = clGrayText
        Font.Charset = TURKISH_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        StyleElements = []
        ExplicitWidth = 177
      end
      object Label42: TLabel
        Left = 342
        Top = 92
        Width = 26
        Height = 17
        Caption = 'Port'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 123
        Top = 45
        Width = 401
        Height = 23
        TabOrder = 0
        Text = 'Edit1'
      end
      object Edit2: TEdit
        Left = 123
        Top = 89
        Width = 211
        Height = 23
        TabOrder = 1
        Text = 'mail.example.com'
      end
      object Edit12: TEdit
        Left = 376
        Top = 89
        Width = 46
        Height = 23
        NumbersOnly = True
        TabOrder = 19
        Text = '587'
      end
      object ComboBox6: TComboBox
        Left = 428
        Top = 89
        Width = 96
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 20
        Text = 'STARTTLS'
        OnChange = ComboBox6Change
        Items.Strings = (
          'STARTTLS'
          'SSL/TLS'
          'Yok')
      end
      object Edit3: TEdit
        Left = 123
        Top = 130
        Width = 401
        Height = 23
        TabOrder = 2
        Text = 'bt@example.com'
      end
      object Edit4: TEdit
        Left = 123
        Top = 178
        Width = 401
        Height = 23
        PasswordChar = '*'
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 123
        Top = 221
        Width = 280
        Height = 23
        TabOrder = 4
        Text = 'bt@example.com'
      end
      object BitBtn4: TBitBtn
        Left = 409
        Top = 220
        Width = 115
        Height = 25
        Caption = 'Test Maili G'#246'nder'
        TabOrder = 21
        OnClick = BitBtn4Click
      end
      object ComboBox1: TComboBox
        Left = 128
        Top = 273
        Width = 65
        Height = 23
        TabOrder = 5
        Items.Strings = (
          ''
          'C:\'
          'D:\'
          'E:\'
          'F:\'
          'G:\'
          'H:\'
          'I:\'
          'J:\'
          'K:\'
          'L:\'
          'M:\'
          'N:\'
          'O:\'
          'P:\'
          'R:\'
          'S:\'
          'T:\'
          'U:\'
          'V:\'
          'Y:\'
          'Z:\'
          '')
      end
      object ComboBox2: TComboBox
        Left = 210
        Top = 273
        Width = 65
        Height = 23
        TabOrder = 6
        Items.Strings = (
          ''
          'C:\'
          'D:\'
          'E:\'
          'F:\'
          'G:\'
          'H:\'
          'I:\'
          'J:\'
          'K:\'
          'L:\'
          'M:\'
          'N:\'
          'O:\'
          'P:\'
          'R:\'
          'S:\'
          'T:\'
          'U:\'
          'V:\'
          'Y:\'
          'Z:\'
          '')
      end
      object ComboBox3: TComboBox
        Left = 294
        Top = 273
        Width = 65
        Height = 23
        TabOrder = 7
        Items.Strings = (
          ''
          'C:\'
          'D:\'
          'E:\'
          'F:\'
          'G:\'
          'H:\'
          'I:\'
          'J:\'
          'K:\'
          'L:\'
          'M:\'
          'N:\'
          'O:\'
          'P:\'
          'R:\'
          'S:\'
          'T:\'
          'U:\'
          'V:\'
          'Y:\'
          'Z:\'
          '')
      end
      object ComboBox4: TComboBox
        Left = 377
        Top = 273
        Width = 65
        Height = 23
        TabOrder = 8
        Items.Strings = (
          ''
          'C:\'
          'D:\'
          'E:\'
          'F:\'
          'G:\'
          'H:\'
          'I:\'
          'J:\'
          'K:\'
          'L:\'
          'M:\'
          'N:\'
          'O:\'
          'P:\'
          'R:\'
          'S:\'
          'T:\'
          'U:\'
          'V:\'
          'Y:\'
          'Z:\'
          '')
      end
      object ComboBox5: TComboBox
        Left = 459
        Top = 273
        Width = 65
        Height = 23
        TabOrder = 9
        Items.Strings = (
          ''
          'C:\'
          'D:\'
          'E:\'
          'F:\'
          'G:\'
          'H:\'
          'I:\'
          'J:\'
          'K:\'
          'L:\'
          'M:\'
          'N:\'
          'O:\'
          'P:\'
          'R:\'
          'S:\'
          'T:\'
          'U:\'
          'V:\'
          'Y:\'
          'Z:\'
          '')
      end
      object BitBtn1: TBitBtn
        Left = 423
        Top = 401
        Width = 101
        Height = 25
        Caption = 'Ayarlar'#305' Kaydet'
        TabOrder = 10
        OnClick = BitBtn1Click
      end
      object Edit6: TEdit
        Left = 128
        Top = 317
        Width = 65
        Height = 23
        NumbersOnly = True
        TabOrder = 11
      end
      object Edit7: TEdit
        Left = 210
        Top = 317
        Width = 65
        Height = 23
        NumbersOnly = True
        TabOrder = 12
      end
      object Edit8: TEdit
        Left = 294
        Top = 317
        Width = 65
        Height = 23
        NumbersOnly = True
        TabOrder = 13
      end
      object Edit9: TEdit
        Left = 377
        Top = 317
        Width = 65
        Height = 23
        NumbersOnly = True
        TabOrder = 14
      end
      object Edit10: TEdit
        Left = 459
        Top = 317
        Width = 65
        Height = 23
        NumbersOnly = True
        TabOrder = 15
      end
      object BitBtn2: TBitBtn
        Left = 91
        Top = 401
        Width = 160
        Height = 25
        Caption = 'Windows Ba'#351'lang'#305'ca Ekle'
        TabOrder = 16
        OnClick = BitBtn2Click
      end
      object BitBtn3: TBitBtn
        Left = 257
        Top = 401
        Width = 160
        Height = 25
        Caption = 'Windows Ba'#351'lang'#305'ctan Kald'#305'r'
        TabOrder = 17
        OnClick = BitBtn3Click
      end
      object Edit11: TEdit
        Left = 129
        Top = 357
        Width = 65
        Height = 23
        NumbersOnly = True
        TabOrder = 18
      end
    end
  end
  object Timer3: TTimer
    Enabled = False
    OnTimer = Timer3Timer
    Left = 108
    Top = 426
  end
  object act: TTrayIcon
    Hint = 'Disk Kontrol'
    OnDblClick = actDblClick
    Left = 169
    Top = 425
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 28
    Top = 426
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    ContentType = 'text/plain'
    Encoding = mePlainText
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 528
    Top = 440
  end
  object smtp: TIdSMTP
    Port = 587
    SASLMechanisms = <>
    Left = 526
    Top = 392
  end
  object SSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':587'
    MaxLineAction = maException
    Port = 587
    DefaultPort = 0
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 495
    Top = 377
  end
  object srvkontroltimer: TTimer
    Interval = 14400000
    OnTimer = srvkontroltimerTimer
    Left = 116
    Top = 354
  end
end
