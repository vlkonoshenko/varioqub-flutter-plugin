// Autogenerated from Pigeon (v10.1.6), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct FetchStatus {
  var error: String? = nil
  var status: Int64? = nil

  static func fromList(_ list: [Any?]) -> FetchStatus? {
    let error: String? = nilOrValue(list[0])
    let status: Int64? = list[1] is NSNull ? nil : (list[1] is Int64? ? list[1] as! Int64? : Int64(list[1] as! Int32))

    return FetchStatus(
      error: error,
      status: status
    )
  }
  func toList() -> [Any?] {
    return [
      error,
      status,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct VarioqubSettingsPigeon {
  var clientId: String? = nil
  var url: String? = nil
  var fetchThrottleIntervalSeconds: Int64? = nil
  var clientFeatures: [String?: String?]? = nil
  var logs: Bool? = nil
  var activateEvent: Bool? = nil

  static func fromList(_ list: [Any?]) -> VarioqubSettingsPigeon? {
    let clientId: String? = nilOrValue(list[0])
    let url: String? = nilOrValue(list[1])
    let fetchThrottleIntervalSeconds: Int64? = list[2] is NSNull ? nil : (list[2] is Int64? ? list[2] as! Int64? : Int64(list[2] as! Int32))
    let clientFeatures: [String?: String?]? = nilOrValue(list[3])
    let logs: Bool? = nilOrValue(list[4])
    let activateEvent: Bool? = nilOrValue(list[5])

    return VarioqubSettingsPigeon(
      clientId: clientId,
      url: url,
      fetchThrottleIntervalSeconds: fetchThrottleIntervalSeconds,
      clientFeatures: clientFeatures,
      logs: logs,
      activateEvent: activateEvent
    )
  }
  func toList() -> [Any?] {
    return [
      clientId,
      url,
      fetchThrottleIntervalSeconds,
      clientFeatures,
      logs,
      activateEvent,
    ]
  }
}

private class VarioqubPigeonCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return FetchStatus.fromList(self.readValue() as! [Any?])
      case 129:
        return VarioqubSettingsPigeon.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class VarioqubPigeonCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? FetchStatus {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? VarioqubSettingsPigeon {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class VarioqubPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return VarioqubPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return VarioqubPigeonCodecWriter(data: data)
  }
}

class VarioqubPigeonCodec: FlutterStandardMessageCodec {
  static let shared = VarioqubPigeonCodec(readerWriter: VarioqubPigeonCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol VarioqubPigeon {
  func initVarioqubWithAppMetricaAdapter(settings: VarioqubSettingsPigeon) throws
  func fetchConfig(completion: @escaping (Result<FetchStatus, Error>) -> Void)
  func activateConfig() throws
  func getString(key: String, defaultValue: String) throws -> String
  func getBoolean(key: String, defaultValue: Bool) throws -> Bool
  func getInt(key: String, defaultValue: Int64) throws -> Int64
  func getDouble(key: String, defaultValue: Double) throws -> Double
  func getId() throws -> String
  func putClientFeature(key: String, value: String) throws
  func clearClientFeatures() throws
  func getAllKeys() throws -> [String]
  func setDefaults(defaults: [String: String]) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class VarioqubPigeonSetup {
  /// The codec used by VarioqubPigeon.
  static var codec: FlutterStandardMessageCodec { VarioqubPigeonCodec.shared }
  /// Sets up an instance of `VarioqubPigeon` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: VarioqubPigeon?) {
    let initVarioqubWithAppMetricaAdapterChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.initVarioqubWithAppMetricaAdapter", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      initVarioqubWithAppMetricaAdapterChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let settingsArg = args[0] as! VarioqubSettingsPigeon
        do {
          try api.initVarioqubWithAppMetricaAdapter(settings: settingsArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      initVarioqubWithAppMetricaAdapterChannel.setMessageHandler(nil)
    }
    let fetchConfigChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.fetchConfig", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      fetchConfigChannel.setMessageHandler { _, reply in
        api.fetchConfig() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      fetchConfigChannel.setMessageHandler(nil)
    }
    let activateConfigChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.activateConfig", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      activateConfigChannel.setMessageHandler { _, reply in
        do {
          try api.activateConfig()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      activateConfigChannel.setMessageHandler(nil)
    }
    let getStringChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.getString", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getStringChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let defaultValueArg = args[1] as! String
        do {
          let result = try api.getString(key: keyArg, defaultValue: defaultValueArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getStringChannel.setMessageHandler(nil)
    }
    let getBooleanChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.getBoolean", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getBooleanChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let defaultValueArg = args[1] as! Bool
        do {
          let result = try api.getBoolean(key: keyArg, defaultValue: defaultValueArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getBooleanChannel.setMessageHandler(nil)
    }
    let getIntChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.getInt", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getIntChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let defaultValueArg = args[1] is Int64 ? args[1] as! Int64 : Int64(args[1] as! Int32)
        do {
          let result = try api.getInt(key: keyArg, defaultValue: defaultValueArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getIntChannel.setMessageHandler(nil)
    }
    let getDoubleChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.getDouble", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getDoubleChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let defaultValueArg = args[1] as! Double
        do {
          let result = try api.getDouble(key: keyArg, defaultValue: defaultValueArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getDoubleChannel.setMessageHandler(nil)
    }
    let getIdChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.getId", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getIdChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getId()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getIdChannel.setMessageHandler(nil)
    }
    let putClientFeatureChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.putClientFeature", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      putClientFeatureChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let valueArg = args[1] as! String
        do {
          try api.putClientFeature(key: keyArg, value: valueArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      putClientFeatureChannel.setMessageHandler(nil)
    }
    let clearClientFeaturesChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.clearClientFeatures", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      clearClientFeaturesChannel.setMessageHandler { _, reply in
        do {
          try api.clearClientFeatures()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      clearClientFeaturesChannel.setMessageHandler(nil)
    }
    let getAllKeysChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.getAllKeys", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getAllKeysChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getAllKeys()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getAllKeysChannel.setMessageHandler(nil)
    }
    let setDefaultsChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.varioqub_plugin.VarioqubPigeon.setDefaults", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setDefaultsChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let defaultsArg = args[0] as! [String: String]
        do {
          try api.setDefaults(defaults: defaultsArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setDefaultsChannel.setMessageHandler(nil)
    }
  }
}
