//
//  External Notification Config.swift
//  Meshtastic Apple
//
//  Copyright (c) Garth Vander Houwen 6/22/22.
//
import SwiftUI

enum OutputIntervals: Int, CaseIterable, Identifiable {

	case oneSecond = 0
	case twoSeconds = 2000
	case threeSeconds = 3000
	case fourSeconds = 4000
	case fiveSeconds = 5000
	case tenSeconds = 10000
	case fifteenSeconds = 15000
	case thirtySeconds = 30000
	case oneMinute = 60000

	var id: Int { self.rawValue }
	var description: String {
		get {
			switch self {
			
			case .oneSecond:
				return "One Second"
			case .twoSeconds:
				return "Two Seconds"
			case .threeSeconds:
				return "Three Seconds"
			case .fourSeconds:
				return "Four Seconds"
			case .fiveSeconds:
				return "Five Seconds"
			case .tenSeconds:
				return "Ten Seconds"
			case .fifteenSeconds:
				return "Fifteen Seconds"
			case .thirtySeconds:
				return "Thirty Seconds"
			case .oneMinute:
				return "One Minute"
			}
		}
	}
}

struct ExternalNotificationConfig: View {
	
	@Environment(\.managedObjectContext) var context
	@EnvironmentObject var bleManager: BLEManager
	
	var node: NodeInfoEntity
	
	@State var enabled = false
	@State var outputMilliseconds = 0
	@State var output = 0
	@State var active = false
	@State var alertMessage = false
	@State var alertBell = false
	
	var body: some View {
		
		VStack {

			Form {
				
				Section(header: Text("Options")) {
					
					Toggle(isOn: $enabled) {

						Label("Enabled", systemImage: "megaphone")
					}
					.toggleStyle(SwitchToggleStyle(tint: .accentColor))
				
					Toggle(isOn: $alertBell) {

						Label("Alert when receiving a bell", systemImage: "bell")
					}
					.toggleStyle(SwitchToggleStyle(tint: .accentColor))
					
					Toggle(isOn: $alertMessage) {

						Label("Alert when receiving a message", systemImage: "message")
					}
					.toggleStyle(SwitchToggleStyle(tint: .accentColor))
				}
				
				Section(header: Text("GPIO")) {
					
					Toggle(isOn: $active) {

						Label("Active", systemImage: "togglepower")
					}
					.toggleStyle(SwitchToggleStyle(tint: .accentColor))
					Text("Specifies whether the external circuit is triggered when the device's GPIO is low or high.")
						.font(.caption)
						.listRowSeparator(.visible)
					
					Picker("GPIO to monitor", selection: $output) {
						ForEach(0..<40) {
							
							if $0 == 0 {
								
								Text("Unset")
								
							} else {
							
								Text("Pin \($0)")
							}
						}
					}
					.pickerStyle(DefaultPickerStyle())
					Text("Specifies the GPIO that your external circuit is attached to on the device.")
						.font(.caption)
						.listRowSeparator(.visible)
					
					Picker("GPIO Output Duration", selection: $outputMilliseconds ) {
						ForEach(OutputIntervals.allCases) { oi in
							Text(oi.description)
						}
					}
					.pickerStyle(DefaultPickerStyle())
					Text("Specifies how long the monitored GPIO should output.")
						.font(.caption)
						.listRowSeparator(.visible)
				}
			}
			.navigationTitle("External Notification Config")
			.navigationBarItems(trailing:

				ZStack {

				ConnectedDevice(bluetoothOn: bleManager.isSwitchedOn, deviceConnected: bleManager.connectedPeripheral != nil, name: (bleManager.connectedPeripheral != nil) ? bleManager.connectedPeripheral.shortName : "?????")
			})
			.onAppear {

				self.bleManager.context = context
			}
			.navigationViewStyle(StackNavigationViewStyle())
		}
	}
}