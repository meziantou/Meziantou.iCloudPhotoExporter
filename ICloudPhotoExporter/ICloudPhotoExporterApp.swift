import AppKit
import SwiftUI

@main
struct ICloudPhotoExporterApp: App {
    @StateObject private var viewModel = AppViewModel()

    init() {
        let bundleID = Bundle.main.bundleIdentifier!
        let runningInstances = NSRunningApplication.runningApplications(withBundleIdentifier: bundleID)
        if runningInstances.count > 1 {
            NSApp.terminate(nil)
        }
    }

    var body: some Scene {
        MenuBarExtra {
            MenuBarStatusView(viewModel: viewModel)
        } label: {
            Image(systemName: viewModel.menuBarSymbolName)
        }
        .menuBarExtraStyle(.window)

        Settings {
            SettingsView(viewModel: viewModel)
        }
        .commands {
            AppMenuCommands(viewModel: viewModel)
        }
    }
}
