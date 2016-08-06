object dbgTCPUDP: TdbgTCPUDP
  Left = 434
  Top = 152
  BorderStyle = bsToolWindow
  Caption = 'Debug Tool'
  ClientHeight = 285
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 10
    Height = 13
    Caption = 'IP'
  end
  object Label2: TLabel
    Left = 136
    Top = 16
    Width = 19
    Height = 13
    Caption = 'Port'
  end
  object redbg: TRichEdit
    Left = 8
    Top = 80
    Width = 249
    Height = 153
    PlainText = True
    TabOrder = 0
    WordWrap = False
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 56
    Width = 97
    Height = 17
    Caption = 'connect'
    TabOrder = 1
    OnClick = CheckBox1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '127.0.0.1'
  end
  object Edit2: TEdit
    Left = 136
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '197'
  end
  object btnSendCmd: TButton
    Left = 8
    Top = 248
    Width = 249
    Height = 25
    Caption = 'btnSendCmd'
    TabOrder = 4
    OnClick = btnSendCmdClick
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 88
    object ESP82661: TMenuItem
      Caption = 'ESP8266'
      object RTOS1: TMenuItem
        Caption = 'RTOS'
      end
      object NONOS1: TMenuItem
        Caption = 'NONOS'
      end
    end
    object ESP321: TMenuItem
      Caption = 'ESP32'
      object RTOS2: TMenuItem
        Caption = 'RTOS'
      end
    end
    object Net1: TMenuItem
      Caption = 'Net'
      object Node1: TMenuItem
        Caption = 'Node'
        object BLE1: TMenuItem
          Caption = 'Bluetooth'
        end
        object USBTTL1: TMenuItem
          Caption = 'USB TTL'
        end
        object RS2321: TMenuItem
          Caption = 'RS232'
        end
        object I2C1: TMenuItem
          Caption = 'I2C'
        end
      end
    end
  end
  object SimpleTCPServer1: TSimpleTCPServer
    Left = 728
    Top = 416
  end
  object SimpleTCPClient1: TSimpleTCPClient
    OnRead = SimpleTCPClient1Read
    Left = 768
    Top = 416
  end
end
