//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import device_info_plus
import package_info_plus
import path_provider_foundation
import platform_device_id_macos
import platform_device_id_v3
import sqflite

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  DeviceInfoPlusMacosPlugin.register(with: registry.registrar(forPlugin: "DeviceInfoPlusMacosPlugin"))
  FPPPackageInfoPlusPlugin.register(with: registry.registrar(forPlugin: "FPPPackageInfoPlusPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  PlatformDeviceIdMacosPlugin.register(with: registry.registrar(forPlugin: "PlatformDeviceIdMacosPlugin"))
  PlatformDeviceIdMacosPlugin.register(with: registry.registrar(forPlugin: "PlatformDeviceIdMacosPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
}
