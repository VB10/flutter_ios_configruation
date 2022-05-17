//
//  ConfigurationApi.swift
//  Runner
//
//  Created by Veli Bacik on 6.05.2022.
//

import Flutter
import UIKit

public class ConfigurationPigeonApi: NSObject, ConfigurationApi {
    private let userDefaults = UserDefaults.standard


    public func fetchVersionWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> AppVersionResult? {
        let result = AppVersionResult()
        result.version = AppVersions.fromString(value: readBundle(bundleKey: .versionEnvironment) ?? "")
        return result
    }

    public func fetchCurrentWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> String? {
        return readBundle(bundleKey: .version) ?? "1.1.0 \(BundleKeys.version.rawValue)"
    }

    public func updateVersionVersion(_ version: Version, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        saveBundleVersion(version: version)
    }


    public func fetchThemeWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> AppThemesResult? {
        let result = AppThemesResult()
        let isDarkMode = userDefaults.value(forKey: BundleKeys.versionTheme.rawValue) as? Bool  ?? false
        result.state = isDarkMode ? .dark : .light
        return result
    }

    public func fetchUserWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> UserModel? {
        let user = UserModel()
        user.userName = "veli"
        user.userPassword = "ahmet"
        return user
    }


    private func readBundle(bundleKey: BundleKeys) -> String? {
        guard let value = userDefaults.value(forKey: bundleKey.rawValue) as? String
            else { return nil }
        return value
    }

    private func saveBundleVersion(version: Version) {
        var versionString = ""
        versionString.append(version.major?.stringValue ?? "")
        versionString.append(".")
        versionString.append(version.minor?.stringValue ?? "")
        versionString.append(".")
        versionString.append(version.patch?.stringValue ?? "")
        userDefaults.set(versionString, forKey: BundleKeys.version.rawValue)
    }

    private enum BundleKeys: String {
        case version = "settings_server_version"
        case versionEnvironment = "settings_server_environment"
        case versionTheme = "settings_server_theme"
    }

    private enum AppVersions: String {
        case dev = "settings_server_dev"
        case prod = "settings_server_production"
        case stragging = "settings_server_stragging"

        static func fromString(value: String?) -> AppVersion {

            guard let version = value else { return AppVersion.dev }

            let enviroment = AppVersions.init(rawValue: version)
            switch enviroment {
            case .dev:
                return .dev
            case .prod:
                return .beta
            case .stragging:
                return .stagging
            case .none:
                return .dev
            }

        }
    }

}



