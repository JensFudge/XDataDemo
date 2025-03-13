object ServerContainer: TServerContainer
  Height = 210
  Width = 431
  object SparkleHttpSysDispatcher: TSparkleHttpSysDispatcher
    Active = True
    Left = 72
    Top = 16
  end
  object XDataServer: TXDataServer
    BaseUrl = 'http://+:2001/tms/xdata'
    Dispatcher = SparkleHttpSysDispatcher
    EntitySetPermissions = <>
    SwaggerOptions.Enabled = True
    SwaggerOptions.AuthMode = Jwt
    SwaggerUIOptions.Enabled = True
    SwaggerUIOptions.TryItOutEnabled = True
    Left = 216
    Top = 16
    object XDataServerJWT: TSparkleJwtMiddleware
      OnGetSecret = XDataServerJWTGetSecret
    end
  end
end
