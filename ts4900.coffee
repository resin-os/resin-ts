deviceTypesCommon = require 'resin-device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

TS_EMMC_BOOT_SELECT = 'Disable the SD boot jumper present on your specifc base board.'

TS_SD_BOOT_SELECT = 'Enable the SD boot jumper present on your specifc base board.'

module.exports =
	slug: 'ts4900'
	aliases: [ 'ts4900' ]
	name: 'Technologic TS-4900'
	arch: 'armv7hf'
	state: 'experimental'

	stateInstructions:
		postProvisioning: [
			instructions.BOARD_SHUTDOWN
			instructions.REMOVE_INSTALL_MEDIA
			TS_EMMC_BOOT_SELECT
			instructions.BOARD_REPOWER
		]

	instructions:
		windows: [
			instructions.WINDOWS_DISK_IMAGER_SD
			instructions.EJECT_SD
			instructions.FLASHER_WARNING
			TS_SD_BOOT_SELECT
			instructions.BOARD_SHUTDOWN
			instructions.REMOVE_INSTALL_MEDIA
			TS_EMMC_BOOT_SELECT
			instructions.BOARD_REPOWER
		]
		osx: [
			instructions.OSX_PLUG_SD
			instructions.OSX_UNMOUNT_SD
			instructions.DD_BURN_IMAGE_SD
			instructions.EJECT_SD
			instructions.FLASHER_WARNING
			TS_SD_BOOT_SELECT
			instructions.BOARD_SHUTDOWN
			instructions.REMOVE_INSTALL_MEDIA
			TS_EMMC_BOOT_SELECT
			instructions.BOARD_REPOWER
		]
		linux: [
			instructions.LINUX_DF_SD
			instructions.DD_BURN_IMAGE_SD
			instructions.EJECT_SD
			instructions.FLASHER_WARNING
			TS_SD_BOOT_SELECT
			instructions.BOARD_SHUTDOWN
			instructions.REMOVE_INSTALL_MEDIA
			TS_EMMC_BOOT_SELECT
			instructions.BOARD_REPOWER
		]

	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-4900.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-4900.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-4900.md#on-mac-and-linux'

	supportsBlink: false

	yocto:
		machine: 'ts4900'
		image: 'resin-image-flasher'
		fstype: 'resin-sdcard'
		version: 'yocto-jethro'
		deployArtifact: 'resin-image-flasher-ts4900.resin-sdcard'

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: commonImg.initialization
