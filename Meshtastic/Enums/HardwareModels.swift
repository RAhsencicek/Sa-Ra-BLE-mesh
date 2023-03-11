//
//  HardwareModels.swift
//  Meshtastic
//
//  Copyright(c) Garth Vander Houwen 3/11/23.
//

import Foundation
// Default of 0 is Client
enum HardwareModels: Int, CaseIterable, Identifiable {

	case UNSET = 0
	case TLORA_V2 = 1
	case TLORA_V1 = 2
	case TLORA_V2_1_1P6 = 3
	case TBEAM = 4
	case HELTEC_V2_0 = 5
	case TBEAM_V0P7 = 6
	case T_ECHO = 7
	case TLORA_V1_1P3 = 8
	case RAK4631 = 9
	case HELTEC_V2_1 = 10
	case HELTEC_V1 = 11
	case LILYGO_TBEAM_S3_CORE = 12
	case RAK11200 = 13
	case NANO_G1 = 14
	case TLORA_V2_1_1P8 = 15
	case TLORA_T3_S3 = 16
	case NANO_G1_EXPLORER = 17
	case STATION_G1 = 25
	case M5STACK = 42
	case HELTEC_V3 = 43
	case HELTEC_WSL_V3 = 45
	
	var id: Int { self.rawValue }
	var description: String {
		switch self {

		case .UNSET:
			return NSLocalizedString("unset", comment: "UNSET")
		case .TLORA_V2:
			return "TLoRa V2"
		case .TLORA_V1:
			return "TLoRa V1"
		case .TLORA_V2_1_1P6:
			return "TLoRa V2.1.1.6"
		case .TBEAM:
			return "TBeam"
		case .HELTEC_V2_0:
			return "HELTEC V2.0"
		case .TBEAM_V0P7:
			return "TBeam 0.7"
		case .T_ECHO:
			return "TEcho"
		case .TLORA_V1_1P3:
			return "TLORA V1.1.3"
		case .RAK4631:
			return "RAK 4631 NRF"
		case .HELTEC_V2_1:
			return "HELTEC V2.1"
		case .HELTEC_V1:
			return "HELTEC V1"
		case .LILYGO_TBEAM_S3_CORE:
			return "TBEAM S3"
		case .RAK11200:
			return "RAK 11200 ESP32"
		case .NANO_G1:
			return "Nano G1"
		case .TLORA_V2_1_1P8:
			return "TLoRa V2.1.1.8"
		case .TLORA_T3_S3:
			return "TLoRa T3 S3"
		case .NANO_G1_EXPLORER:
			return "Nano G1 Explorer"
		case .STATION_G1:
			return "Station G1"
		case .M5STACK:
			return "M5 Stack"
		case .HELTEC_V3:
			return "Heltec V3"
		case .HELTEC_WSL_V3:
			return "Heltec wireless stick lite V3"
		}
		
	}
	var firmwareStrings: [String] {
		switch self {

		case .UNSET:
			return []
		case .TLORA_V2:
			return ["firmware-tlora-v2-"]
		case .TLORA_V1:
			return ["firmware-tlora-v1-"]
		case .TLORA_V2_1_1P6:
			return ["firmware-tlora-v2-1-1.6-"]
		case .TBEAM:
			return ["firmware-tbeam-"]
		case .HELTEC_V2_0:
			return ["firmware-heltec-v2.0-"]
		case .TBEAM_V0P7:
			return ["firmware-tbeam0.7-"]
		case .T_ECHO:
			return ["firmware-t-echo-"]
		case .TLORA_V1_1P3:
			return ["firmware-tlora_v1_3-"]
		case .RAK4631:
			return ["firmware-rak4631-", "firmware-rak4631_eink-"]
		case .HELTEC_V2_1:
			return ["firmware-heltec-v2.1-"]
		case .HELTEC_V1:
			return ["firmware-heltec-v1-"]
		case .LILYGO_TBEAM_S3_CORE:
			return ["firmware-tbeam-s3-core-"]
		case .RAK11200:
			return ["firmware-rak11200-"]
		case .NANO_G1:
			return ["firmware-nano-g1-"]
		case .TLORA_V2_1_1P8:
			return ["firmware-tlora-v2-1-1.8-"]
		case .TLORA_T3_S3:
			return ["firmware-tlora-t3s3-v1-"]
		case .NANO_G1_EXPLORER:
			return ["firmware-nano-g1-explorer-"]
		case .STATION_G1:
			return ["firmware-station-g1-"]
		case .M5STACK:
			return ["firmware-m5stack-core-", "firmware-m5stack-coreink-"]
		case .HELTEC_V3:
			return ["firmware-heltec-v3-"]
		case .HELTEC_WSL_V3:
			return ["firmware-heltec-wsl-v3-"]
		}
		
	}
	func protoEnumValue() -> HardwareModel {

		switch self {

		case .UNSET:
			return HardwareModel.unset
		case .TLORA_V2:
			return HardwareModel.tloraV2
		case .TLORA_V1:
			return HardwareModel.tloraV1
		case .TLORA_V2_1_1P6:
			return HardwareModel.tloraV211P6
		case .TBEAM:
			return HardwareModel.tbeam
		case .HELTEC_V2_0:
			return HardwareModel.heltecV20
		case .TBEAM_V0P7:
			return HardwareModel.tbeamV0P7
		case .T_ECHO:
			return HardwareModel.tEcho
		case .TLORA_V1_1P3:
			return HardwareModel.tloraV11P3
		case .RAK4631:
			return HardwareModel.rak4631
		case .HELTEC_V2_1:
			return HardwareModel.heltecV21
		case .HELTEC_V1:
			return HardwareModel.heltecV1
		case .LILYGO_TBEAM_S3_CORE:
			return HardwareModel.lilygoTbeamS3Core
		case .RAK11200:
			return HardwareModel.rak11200
		case .NANO_G1:
			return HardwareModel.nanoG1
		case .TLORA_V2_1_1P8:
			return HardwareModel.tloraV211P8
		case .TLORA_T3_S3:
			return HardwareModel.tloraT3S3
		case .NANO_G1_EXPLORER:
			return HardwareModel.nanoG1Explorer
		case .STATION_G1:
			return HardwareModel.stationG1
		case .M5STACK:
			return HardwareModel.m5Stack
		case .HELTEC_V3:
			return HardwareModel.heltecV3
		case .HELTEC_WSL_V3:
			return HardwareModel.heltecWslV3
		}
	}
}
