object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 311
  Width = 409
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 144
    Top = 175
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 144
    Top = 64
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=I:\Ancient Codes\Delphi\My Projects\SGP - Delphi 10.2\A' +
        'reco - Teste\DB.FDB'
      'User_Name=sysdba'
      'Password=5173370'
      'DriverID=FB')
    LoginPrompt = False
    Left = 144
    Top = 8
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 144
    Top = 120
  end
end
