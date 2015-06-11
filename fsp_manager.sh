#!/bin/bash
#
# This file is part of the coreboot project.
#
# Copyright (C) 2015 by Martin L Roth <coreboot@martinroth.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc.
#

#set -x # Debug - Turn echo on....

FSPMANAGER_DATE="June 11, 2015"
FSPMANAGER_VERSION="0.0.2"

unset fsp_entry

#####################################################
# Function to add the FSPs and utilities to the install list
# Parameters: 1 = fsp function name
#             2 = fsp description
add_to_install_list()
{
	fsp_entry+=("$1")
	fsp_entry+=("$2")
}

#set up variables for the FSPs
###########################################################################################
# Much of this information comes from the FSP release site: http://intel.com/fsp
# Example function to set up variables below:
#
# This next line adds this entry to the list
# add_to_install_list "fspcpu_ver"                "FSP CPU Version X (Platform Name CRB)"
#
# fspcpu_ver() # mostly arbitrary - I've been using the cpu_name and the release version.
#              # note that the release version inside the download page is different from the
#              # top level.  For baytrail, it's currently 003 at the top level, and G3 inside
#              # the actual download pages.
#{
#	FSP_TITLE=""             # FSP section header from the FSP release site - informational only
#	CPU_NAME=""              # The directory name under intel/cpu and intel/fsp - should match the
#	                         # Kconfig defaults in the FSP chipset folder.
#	URL_FSP_WINDOWS=""       # The stripped download URL for the windows FSP package
#	URL_FSP_LINUX=""         # The stripped download URL for the linux FSP package
#	URL_PLATFORM_GUIDE=""    # URL for the platform guide if it exists.  Currently unused,
#	                         # but not included anywhere else
#	FINAL_FSP_NAME=""        # The actual FSP rom name as it should appear in the intel/fsp/[CPU_NAME]
#	                         # directory.  This should match the Kconfig defaults for this FSP.
#	KIT_DIR_NAME=""          # The directory name that the FSP linux .se file or windows installer
#	                         # created when it unpacks or installs itself.
#	KIT_VBIOS_DIR=""         # The path to the directory containing the vbios binary and .bsf file
#	KIT_FSP_NAME=""          # The name of the FSP ROM file as it gets extracted from the FSP installer
#	WIN_FSP_INSTALL_NAME=""  # The name that needs to be passed in to the windows FSP
#	                         # installer to uninstall it again.  This can be seen when
#	                         # the FSP is getting installed.
#	CURRENT_FSP=1            # 1 if this FSP should be installed for 'All'.  Basically, is this the
#	                         # most recent version of an FSP that has a project in the coreboot tree
#	CRB_DIRECTORY=""         # CRB files in the FSP package
#	CRB_OUTPUT=""            # Directory under intel/mainboard to install the crb files to
#	COMPONENTS_DIR=""        # ME and GBE files included in the FSP package
#
#	set_up_fsp               # Run the installer for this FSP
#}

add_to_install_list "baytrail_G2"                "Bay Trail Gold 2 (Bayley Bay CRB)"
baytrail_G2()
{
	FSP_TITLE="Intel® Atom™ processor E3800 product family (formerly Bay Trail) Gold 2 release"
	CPU_NAME="baytrail"
	URL_FSP_WINDOWS="http://downloadmirror.intel.com/23719/eng/BAY_TRAIL_FSP_KIT.exe"
	URL_FSP_LINUX="http://downloadmirror.intel.com/23720/eng/BAY_TRAIL_FSP_KIT.tgz"
	MD5_FSP_WINDOWS="05a4ed4dbf335db9e8482ccd55bafb45"
	MD5_FSP_LINUX="e385df418b16dad37e03577a2443c355"
	URL_PLATFORM_GUIDE="http://www.intel.com/content/dam/www/public/us/en/documents/guides/atom-e3800-crb-guide.pdf"
	FINAL_FSP_NAME="BAYTRAIL_FSP.fd"
	KIT_DIR_NAME="BAY_TRAIL_FSP_KIT"
	KIT_VBIOS_DIR="Graphics/INTEL_EMGD.VBIOS_GOLD_VERSION_36_2_3_3698"
	KIT_FSP_NAME="BAYTRAIL_FSP_GOLD_002_10-JANUARY-2014.fd"
	WIN_FSP_INSTALL_NAME="Bay Trail Fsp Kit"
	CURRENT_FSP=0 # Updated FSP available
	CRB_DIRECTORY=""
	CRB_OUTPUT=""
	COMPONENTS_DIR=""

	set_up_fsp # Run the installer
}

add_to_install_list "baytrail_G3"                "Bay Trail Gold 3 (Bayley Bay CRB)"
baytrail_G3()
{
	FSP_TITLE="Intel® Atom™ processor E3800 product family (formerly Bay Trail) Gold 3 release"
	CPU_NAME="baytrail"
	URL_FSP_WINDOWS="http://downloadmirror.intel.com/24495/eng/BAY_TRAIL_FSP_KIT_GOLD3.exe"
	URL_FSP_LINUX="http://downloadmirror.intel.com/24496/eng/BAY_TRAIL_FSP_KIT_GOLD3.tgz"
	MD5_FSP_WINDOWS="0fcf50078a7427ca2d85bf47324a50ad"
	MD5_FSP_LINUX="7f47e663564cf57c07155b663330c996"
	URL_PLATFORM_GUIDE="http://www.intel.com/content/dam/www/public/us/en/documents/guides/atom-e3800-crb-guide.pdf"
	FINAL_FSP_NAME="BAYTRAIL_FSP.fd"
	KIT_DIR_NAME="BAY_TRAIL_FSP_KIT"
	KIT_VBIOS_DIR="Graphics/INTEL_EMGD.VBIOS_GOLD_VERSION_36_2_3_3698"
	KIT_FSP_NAME="BAYTRAIL_FSP_GOLD_003_16-SEP-2014.fd"
	WIN_FSP_INSTALL_NAME="Bay Trail Fsp Kit"
	CURRENT_FSP=1
	CRB_DIRECTORY="BayleyBay"
	CRB_OUTPUT="intel/bayleybay"
	COMPONENTS_DIR="ImageComponents"

	set_up_fsp # Run the installer
}

add_to_install_list "haswell_Gold1"              "Haswell mobile and Lynx Point Gold 1 (Lava Canyon CRB)"
haswell_Gold1()
{
	FSP_TITLE="4th Generation Intel® Core™ processors with mobile Intel® QM87 and HM86 chipsets (formerly Shark Bay mobile: Haswell and Lynx Point) Gold 1 release"
	CPU_NAME="haswell"
	URL_FSP_WINDOWS="http://downloadmirror.intel.com/23694/eng/SHARK_BAY_FSP_KIT.exe"
	URL_FSP_LINUX="http://downloadmirror.intel.com/23695/eng/SHARK_BAY_FSP_KIT.tgz"
	MD5_FSP_WINDOWS="997ebb8dbf0f56e38c165ac14654d87c"
	MD5_FSP_LINUX="1d85f646b97fedca588bda4d40726bc7"
	URL_PLATFORM_GUIDE="" #no platform guide
	FINAL_FSP_NAME=""
	KIT_DIR_NAME="SHARK_BAY_FSP_KIT"
	KIT_VBIOS_DIR="Graphics"
	KIT_FSP_NAME="SHARKBAY_FSP_GOLD_001_16-DEC-2013.fd"
	WIN_FSP_INSTALL_NAME="Shark Bay Fsp Kit"
	CRB_DIRECTORY="LavaCanyon"
	CRB_OUTPUT="intel/lavacanyon"
	COMPONENTS_DIR=""
	CURRENT_FSP=0 # Updated FSP available

	set_up_fsp # Run the installer
}

add_to_install_list "haswell_Gold2"              "Haswell mobile and Lynx Point Gold 2 (Lava Canyon CRB)"
haswell_Gold2()
{
	FSP_TITLE="4th Generation Intel® Core™ processors with mobile Intel® QM87 and HM86 chipsets (formerly Shark Bay mobile: Haswell and Lynx Point) Gold 2 release"
	CPU_NAME="haswell"
	URL_FSP_WINDOWS="http://downloadmirror.intel.com/24266/eng/SHARK_BAY_FSP_KIT_GOLD2.exe"
	URL_FSP_LINUX="http://downloadmirror.intel.com/24265/eng/SHARK_BAY_FSP_KIT_GOLD2.tgz"
	MD5_FSP_WINDOWS="b310b5bb10cfade43b3ffe43c8669b68"
	MD5_FSP_LINUX="a4927df5c65e539da42974187861a95f"
	URL_PLATFORM_GUIDE="" #no platform guide
	FINAL_FSP_NAME=""
	KIT_DIR_NAME="SHARK_BAY_FSP_KIT"
	KIT_VBIOS_DIR="Graphics"
	KIT_FSP_NAME="SHARKBAY_FSP_GOLD_002_04-JUN-2014.fd"
	WIN_FSP_INSTALL_NAME="Shark Bay Fsp Kit"
	CRB_DIRECTORY="LavaCanyon"
	CRB_OUTPUT="intel/lavacanyon"
	COMPONENTS_DIR="ImageComponents"
	CURRENT_FSP=0 # No current platforms in coreboot

	set_up_fsp # Run the installer
}

add_to_install_list "ivybridge_cavecreek_001"    "Ivy Bridge Gladden and Cave Creek Gold 1 (Stargo 2 CRB)"
ivybridge_cavecreek_001()
{
	FSP_TITLE="Intel® Xeon® processor E3-1125C v2, Intel® Xeon® processor E3-1105C v2, Intel® Pentium® processor B925C, and Intel® Core™ i3-3115C processors for communications infrastructure with Intel® Communications Chipset 89xx Series Platform Controller Hub (formerly Crystal Forest Refresh: Ivy Bridge Gladden and Cave Creek) Gold 1 release"
	CPU_NAME="ivybridge_i89xx"
	URL_FSP_WINDOWS="http://downloadmirror.intel.com/23617/eng/CRYSTAL_FOREST_REFRESH_IVB_FSP_KIT.exe"
	URL_FSP_LINUX="http://downloadmirror.intel.com/23618/eng/CRYSTAL_FOREST_REFRESH_IVB_FSP_KIT.tgz"
	MD5_FSP_WINDOWS="f814a00deefca25cb3b192827ae4929a"
	MD5_FSP_LINUX="19f005dfa1f87e08db8abff9868f08ae"
	URL_PLATFORM_GUIDE="" #no platform guide
	KIT_DIR_NAME="CRYSTAL_FOREST_REFRESH_IVB_FSP_KIT"
	KIT_VBIOS_DIR="" #no vbios
	KIT_FSP_NAME="CRYSTALFOREST_IVB_FSP_GOLD_001_20-DECEMBER-2013.fd"
	FINAL_FSP_NAME="FvFsp.bin"
	WIN_FSP_INSTALL_NAME="Crystal Forest Refresh Ivy Bridge Fsp Kit"
	CURRENT_FSP=0 # No current platforms in coreboot
	CRB_DIRECTORY=""
	CRB_OUTPUT=""
	COMPONENTS_DIR=""

	set_up_fsp # Run the installer
}

add_to_install_list "ivybridge_pantherpoint_001" "Ivy Bridge and Panther Point Gold 1 (Cougar Canyon 2 CRB)"
ivybridge_pantherpoint_001()
{
	FSP_TITLE="3rd generation Intel® Core™ and Intel® Celeron® processors with mobile Intel® HM76 and QM77 chipsets platform (formerly Chief River Platform: Ivy Bridge and Panther Point) Gold 1 release"
	CPU_NAME="ivybridge_bd82x6x"
	URL_FSP_WINDOWS="http://downloadmirror.intel.com/23614/eng/CHIEF_RIVER_FSP_KIT.exe"
	URL_FSP_LINUX="http://downloadmirror.intel.com/23615/eng/CHIEF_RIVER_FSP_KIT.tgz"
	MD5_FSP_WINDOWS="2edbcc75b7c64e47c87650f2ee215aca"
	MD5_FSP_LINUX="b5fb21a694a1d681b7e98e6d3a7762a3"
	URL_PLATFORM_GUIDE="http://www.intel.com/content/dam/www/public/us/en/documents/guides/3rd-gen-core-mobile-hm76-qm77-chipset-crb-platform-guide.pdf"
	KIT_DIR_NAME="CHIEF_RIVER_FSP_KIT"
	KIT_VBIOS_DIR="Graphics"
	KIT_FSP_NAME="CHIEFRIVER_FSP_GOLD_001_09-OCTOBER-2013.fd"
	FINAL_FSP_NAME="FvFsp.bin"
	WIN_FSP_INSTALL_NAME="Chief River FSP Kit"
	CRB_DIRECTORY="CougarCanyon2"
	CRB_OUTPUT="intel/cougarcanyon2"
	CURRENT_FSP=1
	COMPONENTS_DIR=""

	set_up_fsp # Run the installer
}

add_to_install_list "rangeley_001"               "Rangeley Gold 1 (Mohon Peak CRB)"
rangeley_001()
{
	FSP_TITLE="Intel® Atom™ processor C2000 product family (formerly Rangeley) Gold 1 release"
	CPU_NAME="rangeley"
	URL_FSP_WINDOWS="http://downloadmirror.intel.com/23675/eng/RANGELEY_FSP_KIT.exe"
	URL_FSP_LINUX="http://downloadmirror.intel.com/23676/eng/RANGELEY_FSP_KIT.tgz"
	MD5_FSP_WINDOWS="03d235a99fd1cd1130d6567f62fb3f25"
	MD5_FSP_LINUX="205b01dca9dfa06fde8da302bd382fc1"
	URL_PLATFORM_GUIDE="" #no platform guide
	FINAL_FSP_NAME="FvFsp.bin"
	KIT_DIR_NAME="RANGELEY_FSP_KIT"
	KIT_VBIOS_DIR="" #rangeley has no video
	KIT_FSP_NAME="RANGELEY_FSP_POSTGOLD_001_20131218.fd"
	WIN_FSP_INSTALL_NAME="Rangeley FSP Kit"
	CURRENT_FSP=1
	CRB_DIRECTORY=""
	CRB_OUTPUT=""
	COMPONENTS_DIR=""

	set_up_fsp # Run the installer
}

add_to_install_list "tunnelcreek_001"            "Tunnel Creek and Topcliff Gold 1"
tunnelcreek_001()
{
	FSP_TITLE="Intel® Atom™ processor E6xx series with Intel® Platform Controller Hub EG20T (formerly Queens Bay: Tunnel Creek and Topcliff) Gold 1 release"
	CPU_NAME="tunnelcreek"
	URL_FSP_WINDOWS="http://downloadmirror.intel.com/23651/eng/QUEENS_BAY_FSP_KIT.exe"
	URL_FSP_LINUX="http://downloadmirror.intel.com/23655/eng/QUEENS_BAY_FSP_KIT.tgz"
	MD5_FSP_WINDOWS="f3d4fe4aabb70ea54129b4084ae17980"
	MD5_FSP_LINUX="4f2725ca2c348d1153987909f8063613"
	URL_PLATFORM_GUIDE="" #no platform guide
	KIT_DIR_NAME="QUEENS_BAY_FSP_KIT"
	KIT_VBIOS_DIR="" #no graphics
	KIT_FSP_NAME="QUEENSBAY_FSP_GOLD_001_20-DECEMBER-2013.fd"
	FINAL_FSP_NAME=""
	WIN_FSP_INSTALL_NAME="Queens Bay FSP Kit"
	CURRENT_FSP=0 # No current platforms in coreboot
	CRB_DIRECTORY=""
	CRB_OUTPUT=""
	COMPONENTS_DIR=""

	set_up_fsp # Run the installer
}

#downloads the BCT package, extracts it, copies it into the "intel/bct" directory
add_to_install_list "set_up_bct"                 "Set Binary Configuration Tool"
set_up_bct()
{
	# The current URLs for the BCT packages on http://intel.com/fsp
	URL_BCT_WINDOWS="http://downloadmirror.intel.com/23619/eng/bct-3.1.2-i686.win32.exe"
	MD5_BCT_WINDOWS="8fea37758b3cfe5511f955585c4c9f5f"
	URL_BCT_LINUX_64="http://downloadmirror.intel.com/23622/eng/bct-3.1.2-x86_64.fc14.tar.gz"
	MD5_BCT_LINUX_64="8b280cb33349384f6a982e6d92f6f7db"
	URL_BCT_LINUX_32="http://downloadmirror.intel.com/23620/eng/bct-3.1.2-i686.fc14.tar.gz"
	MD5_BCT_LINUX_32="f233223b74420e32b125d816e53471f2"

	# Set up for the current OS
	if [ "$RUNNING_OS" = "WINDOWS" ]; then
		BCT_URL="${URL_BCT_WINDOWS}"
		MD5="${MD5_BCT_WINDOWS}"
	elif [ "$RUNNING_OS" = "LINUX" ] && [ "$RUNNING_OS_BITS" = "64" ]; then
		BCT_URL="${URL_BCT_LINUX_64}"
		MD5="${MD5_BCT_LINUX_64}"
	elif [ "$RUNNING_OS" = "LINUX" ] && [ "$RUNNING_OS_BITS" = "32" ]; then
		BCT_URL="${URL_BCT_LINUX_32}"
		MD5="${MD5_BCT_LINUX_32}"
	fi
	BCT_BINARY="${BCT_URL##*/}"

	# Download the file if needed
	download_file "$BCT_BINARY" "$BCT_URL" "$MD5"
	if [ "$DOWNLOAD_ALL" = "1" ]; then
		return
	fi

	#handle a directory that already exists by moving it into 'old'
	if [ -d "${INTEL_DIR}/bct" ]; then
		mkdir -p "${INTEL_DIR}/old"
		old_bct_dir=$(mktemp -d --tmpdir="${INTEL_DIR}/old" bct.XXX)
		msgbox "Warning: Directory for bct already exist.\nMoving to $old_bct_dir"
		mv "${INTEL_DIR}/bct/." "$old_bct_dir"
	fi

	if [ "$RUNNING_OS" = "WINDOWS" ]; then
		# On windows, install the BCT, then copy all the files to the intel/bct directory.
		msgbox "Next, the BCT installer will run.\nPlease switch to the install window and use the default install location.\nThe script will continue after the installer finishes."
		chmod +x "${FSP_PACKAGE_DIR}/${BCT_BINARY}"
		BCT_EXE_PATH=$(cygpath -w "${FSP_PACKAGE_DIR}/${BCT_BINARY}")
		cmd.exe /c "$BCT_EXE_PATH"
		if [ "$RUNNING_OS_BITS" = "64" ]; then
			INSTALLED_EXE_PATH=$(cygpath "C:\Program Files (x86)\BCT")
		else
			INSTALLED_EXE_PATH=$(cygpath "C:\Program Files\BCT")
		fi

		mkdir -p "${INTEL_DIR}/bct"
		cp -r "${INSTALLED_EXE_PATH}/." "${INTEL_DIR}/bct"

		# Display a note about why the tool doesn't look like it works in command line
		# mode on windows.
		echo
		msgbox "From the release notes for BCT version 3.1.2:\n\n" \
		"The Windows version of BCT will not print messages to the console. This only\n" \
		"affects Windows users who want to run BCT from the command line and not use\n" \
		"the GUI. BCT will read the command line arguments correctly and do things\n" \
		"such as generate an ABSF from a BSF, patch, and rebase a binary, but it will\n" \
		"not print any messages to the console.\n" \
	else
		# On linux, just untar the archive to the intel/bct directory
		tar xvf "${FSP_PACKAGE_DIR}/${BCT_BINARY}" -C "${INTEL_DIR}"
	fi
}

# Display text, then wait for the user
msgbox()
{
	if [ -f "$dialog" ]; then
		"$dialog" --msgbox "$1" 0 0
	else
		printf "\n%s\n" "$1"
		read -p "Press <ENTER> to continue."
	fi
}

# Set some variables to hold the OS & bit architecture
detect_os()
{
	if [ "$OSTYPE" = "cygwin" ]; then
		RUNNING_OS="WINDOWS"
	elif [ "$OSTYPE" = "linux-gnu" ]; then
		RUNNING_OS="LINUX"
	else
		msgbox "Error: Unsupported OS.  The FSP packages come as binaries for linux and windows only."
		exit 1
	fi

	if [ "$(uname -a | grep 'x86_64')" ]; then
		RUNNING_OS_BITS="64"
	else
		RUNNING_OS_BITS="32"
	fi

#	echo "${RUNNING_OS} (${RUNNING_OS_BITS} bit) OS detected"
}

#####################################################
# Downloads a file from a URL and checksums it
# Parameters: 1 = Filename to save the file to
#             2 = URL to download the file from
#             3 = md5 checksum
download_file()
{
	FSP_FILENAME=$1
	FSP_URL=$2
	FILE_MD5SUM=$3

	#download the packages into the intel directory to save for later
	if [ -e "${FSP_PACKAGE_DIR}/${FSP_FILENAME}" ]; then
		calculated_md5=$("$MD5SUM" "${FSP_PACKAGE_DIR}/${FSP_FILENAME}" | "$CUT" -f 1 -d ' ')
		if [ -z "$FILE_MD5SUM" ] || [ "$SKIP_MD5_CHECKSUM" = "1" ] || \
			[ "$FILE_MD5SUM" = "$calculated_md5" ]; then
			return
		else
			msgbox "Warning, the saved MD5 checksum for this file does not match the actual checksum.\nThis may be the result of an incomplete or failed download from an earlier install attempt.\nUse the -nomd5 (-n) option to ignore this in the future if you desire.\nDeleting the file and downloading it again.\n"
			rm -f "${FSP_PACKAGE_DIR}/${FSP_FILENAME}"
		fi
	fi

	# Download the package if the tools are available, or tell the user how to get the package
	if [ "$fetch" ]; then
		mkdir -p "${FSP_PACKAGE_DIR}"
		echo "Downloading ${WIN_FSP_INSTALL_NAME} for ${RUNNING_OS}"
		"$fetch" "${FSP_URL}" -o "${FSP_PACKAGE_DIR}/${FSP_FILENAME}"
		calculated_md5=$("$MD5SUM" "${FSP_PACKAGE_DIR}/${FSP_FILENAME}" | $CUT -f 1 -d ' ')
		echo "MD5 Checksum for ${FSP_FILENAME} is ${calculated_md5}"
		if [ "$SKIP_MD5_CHECKSUM" = "1" ]; then
			echo "Skipping checksum comparison."
		elif [ -z "$FILE_MD5SUM" ]; then
			echo "Note: There is no saved checksum for this file".
		elif [ "$FILE_MD5SUM" = "$calculated_md5" ]; then
			echo "This matches the saved checksum."
		else
			msgbox "ERROR: Thie calculated checksum does *NOT* match the saved checksum.\nCalculated: $calculated_md5\nSaved:      $FILE_MD5SUM\nUse the -nomd5 (-n) option to ignore this error in the future if you desire.\n"
			exit 1
		fi
	else
		printf "Error: Download tools are not installed.  To continue, download the\npackage from\n%s\nand place it in\n%s\n" "${FSP_URL}" "${FSP_PACKAGE_DIR}"
		msgbox "Error: Download tools are not installed.  To continue, download the\npackage from\n${FSP_URL}\nand place it in\n${FSP_PACKAGE_DIR}\n"
		exit 1
	fi
}

##################################################################################
# Extract the FSP files - These are delivered as linux or windows executable files
# so that it can't be extracted without agreeing to the license.
# Parameters: 1 = Filename of the FSP package
extract_linux_fsp()
{
	FSP_FILE=$1

	# On linux, we need to untar the package and get the .se (executable)
	# file out.  When that's run, it creates a new directory under the
	# current directory with all the files in it.
	tmp_fsp_dir=$(mktemp -d --tmpdir FSP.XXXXXXXX)
	pushd "$tmp_fsp_dir"
	tar xvf "${FSP_PACKAGE_DIR}/${FSP_FILE}" "${KIT_DIR_NAME}.se"

	#verify the initial extraction of the .se file happened correctly
	if [ ! -f  "${KIT_DIR_NAME}.se" ]; then
		msgbox "Error: Failed to extract ${KIT_DIR_NAME}.se from ${FSP_FILE}"
		INSTALL_FAILURE=1
		return
	fi

	#display the instructions, then run the self extracting file.
	msgbox "The following Intel license agreement must be\naccepted for extraction and setup to continue."
	chmod +x "./${KIT_DIR_NAME}.se"
	"./${KIT_DIR_NAME}.se"
	popd
}

##################################################################################
# Extract the FSP files - These are delivered as linux or windows executable files
# so that it can't be extracted without agreeing to the license.
# Parameters: 1 = Filename of the FSP package
extract_windows_fsp()
{
	FSP_FILE=$1
	# Set up to run the installer under windows
	msgbox "Next, the FSP installer will run.\n\nPlease switch to the install window and use the default install location.\n\nThe script will continue after the installer finishes, and should be uninstalled automatically."
	chmod +x "${FSP_PACKAGE_DIR}/${FSP_FILE}"
	FSP_EXE_PATH=$(cygpath -w "${FSP_PACKAGE_DIR}/${FSP_FILE}")

	# Actually run the FSP installer - this doesn't seem to work directly from bash
	cmd.exe /c "$FSP_EXE_PATH"

	# Since the FSP installs to the root directory (REALLY?), set that to be our tmp_fsp_dir...
	# Hopefully this will change, but then we'll need another variable.
	tmp_fsp_dir=$(cygpath "C:")
}

# Clean up the intall directory - nobody needs a slew of FSP directories in c:\
clean_up_windows_files()
{
	# On windows, run the uninstaller if possible.  Just return if the installer name isn't configured.
	if [ ! "$WIN_FSP_INSTALL_NAME" ]; then
		# This is mostly for development, as the variables should be set for all finished FSP entries
		msgbox "Setup completed successfully.\nNot enough information to run the uninstaller.\nPlease uninstall manually."
		return
	fi

	# Run the uninstaller - this also deleted the fsp exe, but doesn't delete the install directory.
	# I'm probably doing something wrong here, because that doesn't seem quite right, but this
	# process achieves the desired results.
	msgbox "FSP configuration completed successfully.\nNow uninstalling the $WIN_FSP_INSTALL_NAME package.\n\nPlease switch to the uninstall window.\nThe script will continue after the uninstaller finishes."
	cp "$FSP_EXE_PATH" "$FSP_EXE_PATH.bak"
	cmd.exe /c "$FSP_EXE_PATH /u:\"$WIN_FSP_INSTALL_NAME\""
	rm -rf "${tmp_fsp_dir}/${KIT_DIR_NAME}"
	mv "$FSP_EXE_PATH.bak" "$FSP_EXE_PATH"
}

# Handle a directory that already exists by moving it into the 'old' directory
# there may be times that multiple versions are needed for different platforms,
# but the older versions may be moved manually
handle_existing_fsp()
{
	# TODO: Ask the user where they would like the older version placed
	#       instead of just making a temporary directory under old.  This would
	#       give them the chance to rename the directories to "xxx_gold1" when
	#       the xxx_gold2 FSP is released, and have them live alongside each other.
	if [ -d "${INTEL_DIR}/cpu/${CPU_NAME}" ] || [ -d "${INTEL_DIR}/fsp/${CPU_NAME}" ]; then
		mkdir -p "${INTEL_DIR}/old"
		old_fsp_dir=$(mktemp -d --tmpdir="${INTEL_DIR}/old" ${CPU_NAME}.XXX)
		msgbox "Warning: Directories for ${CPU_NAME} already exist.\nMoving to $old_fsp_dir"
		mkdir -p "$old_fsp_dir/cpu"
		mv "${INTEL_DIR}/cpu/${CPU_NAME}" "$old_fsp_dir/cpu"
		mkdir -p "$old_fsp_dir/fsp"
		mv "${INTEL_DIR}/fsp/${CPU_NAME}" "$old_fsp_dir/fsp"
	fi
}

# Move the extracted fsp files into the new locations
place_fsp_files()
{
	# Not all FSP boards have graphics - ignore vbios if there isn't a vbios dir.
	if [ ! -z "${KIT_VBIOS_DIR}" ]; then
		mkdir -p "${INTEL_DIR}/cpu/${CPU_NAME}/vbios"
		cp -r "${tmp_fsp_dir}/${KIT_DIR_NAME}/${KIT_VBIOS_DIR}/." "${INTEL_DIR}/cpu/${CPU_NAME}/vbios"
	fi

	# Copy in the microcode directory if microcode was supplied.
	if [ -d "$tmp_fsp_dir/${KIT_DIR_NAME}/Microcode" ]; then
		mkdir -p "${INTEL_DIR}/cpu/${CPU_NAME}/microcode"
		cp -r "${tmp_fsp_dir}/${KIT_DIR_NAME}/Microcode/." "${INTEL_DIR}/cpu/${CPU_NAME}/microcode/"
	fi

	# Copy everything in the FSP directory.
	mkdir -p "${INTEL_DIR}/fsp/${CPU_NAME}"
	cp -r "${tmp_fsp_dir}/${KIT_DIR_NAME}/FSP/." "${INTEL_DIR}/fsp/${CPU_NAME}/"

	# If a final fsp name was requested copy the package fsp to that name.
	if [ ! -z ${FINAL_FSP_NAME} ]; then
		cp "${INTEL_DIR}/fsp/${CPU_NAME}/${KIT_FSP_NAME}" "${INTEL_DIR}/fsp/${CPU_NAME}/${FINAL_FSP_NAME}"
	fi

	# If a components directory exists, copy it into the cpu directory
	# Not all FSP boards have graphics - ignore components if there isn't a components dir.
	if [ ! -z "${COMPONENTS_DIR}" ]; then
		mkdir -p "${INTEL_DIR}/cpu/${CPU_NAME}"
		cp -r "${tmp_fsp_dir}/${KIT_DIR_NAME}/${COMPONENTS_DIR}/." "${INTEL_DIR}/cpu/${CPU_NAME}/"
	fi



	# If a documentation directory exists, copy it into the fsp directory
	# Use find with iname as the capitalization is different on windows vs linux
	DOCUMENTATION_DIR="${INTEL_DIR}/fsp/${CPU_NAME}/DOCUMENTATION"
	fsp_documentation=$(find "${tmp_fsp_dir}/${KIT_DIR_NAME}" -iname 'documentation')
	if [ "$fsp_documentation"  ]; then
		mkdir -p "${DOCUMENTATION_DIR}"
		cp -r "$fsp_documentation/." "${DOCUMENTATION_DIR}"
	fi

	#if there's a platform guide, copy it into the documentation directory
	if [ ! -z "$URL_PLATFORM_GUIDE" ]; then
		FSP_GUIDE_FILE="${FSP_PACKAGE_DIR}/${URL_PLATFORM_GUIDE##*/}"
		if [ -e "${FSP_GUIDE_FILE}" ]; then
			cp "${FSP_GUIDE_FILE}" "${DOCUMENTATION_DIR}"
		fi
	fi

	#if there are any pdfs at the top level, copy them into the documentation directory
	for PDF in ${tmp_fsp_dir}/${KIT_DIR_NAME}/*.pdf; do
		echo "copying $PDF to ${DOCUMENTATION_DIR}"
		cp -n "$PDF" "${DOCUMENTATION_DIR}"
	done
}

# Some CRBs have customized files inside the FSP distribution.
# These files should be placed in the intel/mainboard/intel/[CRB_NAME]
# folder.
# Customized versions of files for other boards would be placed in a
# corresponding intel/mainboard/[VENDOR]/[BOARD_NAME] directory.
# These files should not be placed inside the coreboot directory so
# that they don't get accidentally distributed.
place_mainboard_files()
{
	if [ ! -z "$CRB_DIRECTORY" ] && [ ! -z "$CRB_OUTPUT" ]; then
		mkdir -p "${INTEL_DIR}/mainboard/${CRB_OUTPUT}"
		cp -r "${tmp_fsp_dir}/${KIT_DIR_NAME}/${CRB_DIRECTORY}/." "${INTEL_DIR}/mainboard/${CRB_OUTPUT}"
	fi
}

compare_with_vendorcode()
{
	echo
	# TODO: After setting up the FSP directory, compare the include files with
	#       the files that are in coreboot/src/vendorcode/intel/fsp/[FSP]/include
	#       and warn the user if they're different.  The vendorcode files are the
	#       ones that are actually built into the rom, so it's pretty important
	#       that the correct ones are used.
}

# Download and extract the FSP, then move the pieces into the correct locations
# and clean up.
set_up_fsp()
{
	# Return if we're only installing current useful installs and this
	# FSP isn't marked as one of those.
	if [ "$RUN_ALL_INSTALLS" = "1" ] && [ "$CURRENT_FSP" = "0" ] && \
		[ ! "${DOWNLOAD_ALL}" = "1" ]; then
		return
	fi

	if [ "$RUNNING_OS" = "WINDOWS" ]; then
		URL="${URL_FSP_WINDOWS}"
		MD5="${MD5_FSP_WINDOWS}"
	else
		URL="${URL_FSP_LINUX}"
		MD5="${MD5_FSP_LINUX}"
	fi
	FSP_FILE="${URL##*/}"

	# Download the fsp if needed
	download_file "$FSP_FILE" "$URL" "$MD5"

	# Download the platform guide if needed.
	if [ ! -z "$URL_PLATFORM_GUIDE" ]; then
		FSP_GUIDE_FILE="${URL_PLATFORM_GUIDE##*/}"
		download_file "${FSP_GUIDE_FILE}" "$URL_PLATFORM_GUIDE" ""
	fi

	if [ "${DOWNLOAD_ALL}" = "1" ]; then
		return
	fi

	echo "Installing FSP for ${FSP_TITLE}"
	echo

	# handle the OS specific extraction
	if [ "$RUNNING_OS" = "WINDOWS" ]; then
		extract_windows_fsp "$FSP_FILE"
	else
		extract_linux_fsp "$FSP_FILE"
	fi

	# Verify extraction before continuing
	if [ ! -e "$tmp_fsp_dir/${KIT_DIR_NAME}/FSP/${KIT_FSP_NAME}" ]; then
		msgbox "Error: Could not find $tmp_fsp_dir/${KIT_DIR_NAME}/FSP/${KIT_FSP_NAME}. The Intel $CPU_NAME FSP did not extract successfully."
		"$showtree" "$tmp_fsp_dir/${KIT_DIR_NAME}"
		INSTALL_FAILURE=1
		return
	fi

	handle_existing_fsp
	place_fsp_files
	place_mainboard_files


	if [ ! "$LEAVE_FSP_INSTALL" = "1" ] && [ "$RUNNING_OS" = "WINDOWS" ]; then
		clean_up_windows_files
	elif [ ! "$LEAVE_FSP_INSTALL" = "1" ] && [ "$RUNNING_OS" = "LINUX" ]; then
		# On linux, we can just delete the temp directory.
		# On windows, this is C:/ - don't delete it on windows.  Just don't.
		rm -rf "$tmp_fsp_dir"
	else
		echo "Files will be left in $tmp_fsp_dir/${KIT_DIR_NAME}"
		"$showtree" "$tmp_fsp_dir/${KIT_DIR_NAME}"
	fi

	compare_with_vendorcode
}

# Show a menu to let the user choose which installs to run
choose_what_to_install()
{
	# Get the packages to install from the user
	if [ "$dialog" ]; then
		#create the dialog command string to display the menu
		declare -a dialog_param=("$dialog" "--title" "FSPs to set up" "--checklist" \
			"Choose which FSPs or utility to install:" 0 0 0)
		local i=0
		while [ "$i" -lt "${#fsp_entry[@]}" ]; do
			dialog_param=("${dialog_param[@]}" "${fsp_entry[i]}" "${fsp_entry[i+1]}" "OFF")
			i=$((i+2))
		done

		# Run dialog / whiptail to get the install options
		FSPS_TO_INSTALL=$("${dialog_param[@]}" 3>&1 1>&2 2>&3)
		exitstatus=$?
	else
		#show a simple text menu
		show_installs
		read -p "Enter an FSP or utility to install (the text before the colon): " \
			-a FSPS_TO_INSTALL
		exitstatus=0
	fi

	if [ $exitstatus ] && [ ! "${FSPS_TO_INSTALL}" ]; then
		echo "No FSPs selected.  Exiting"
		exit 0
	fi
}

# Add each installer to the list to run.  The installs that aren't marked
# as current will be filtered at install time
add_all_installs()
{
	local i=0
	while [ "$i" -lt "${#fsp_entry[@]}" ]; do
		FSPS_TO_INSTALL+="${fsp_entry[i]} "
		i=$((i+2)) # skip over the description
	done
}

# Loop through install variable array, printing them out.
show_installs()
{
	local i=0
	echo "Available FSPs and Utilities:"
	while [ "$i" -lt "${#fsp_entry[@]}" ]; do
		printf "%-26s: %s\n" "${fsp_entry[i]}" "${fsp_entry[i+1]}"
		i=$((i+2))
	done
}

# Loop through, running the install functions if the function exists
run_selected_installs()
{
	# Loop through, running the install functions if the function exists
	for INSTALL_FUNC in $FSPS_TO_INSTALL; do
		func_not_found="$(type -t ${INSTALL_FUNC} 2>&1 | grep 'not found')"
		if [ -z "${func_not_found}" ]; then
			eval "${INSTALL_FUNC}"
		else
			echo "func_not_found: '${func_not_found}'"
			echo "Error: ${INSTALL_FUNC} is not valid."
			INSTALL_FAILURE=1
		fi
	done
}

download_all_installs()
{
	DOWNLOAD_ALL=1;
	add_all_installs

	# do 64-bit windows and linux
	RUNNING_OS_BITS="64"
	RUNNING_OS="WINDOWS"
	run_selected_installs
	RUNNING_OS="LINUX"
	run_selected_installs

	# do 32-bit windows and linux
	RUNNING_OS_BITS="32"
	RUNNING_OS="WINDOWS"
	run_selected_installs
	RUNNING_OS="LINUX"
	run_selected_installs
}

#Display the current version
print_version()
{
	cat << END_OF_HELP

coreboot fspmanager v$FSPMANAGER_VERSION ($FSPMANAGER_DATE)

Copyright (C) 2015 by Martin L Roth <coreboot@martinroth.com>

This program is free software; you may redistribute it under the terms
of the GNU General Public License. This program has absolutely no
warranty.

END_OF_HELP
}

# Display the help commands
show_help()
{
	printf "Usage: %s [options]\n" "$0"
	printf "       %s [-V|--version]\n" "$0"
	printf "       %s [-h|--help]\n\n" "$0"

	printf "Options:\n"
	printf "    [-s|--showall]                print list of installable FSPs and Utilities\n"
	printf "    [-i|--install <FSP/Utility>]  attempt to build target vendor/board only\n"
	printf "    [-a|--all]                    install all current FSPs\n"
	printf "    [-S|--source <script>]        Add an additional script for more installs"
	printf "    [-D|--download]               download all FSPs and utilities- does not install them"
	printf "    [-n|--nomd5]                  Skip md5 checking of the downloaded files\n"
	printf "    [-L|--leave}                  Leave the FSP installer files instead of deleting them\n"
## TODO options
##	printf "    [-I|--inteldir]               change the intel install directory\n" #remember to reset all top level directories based on the intel directory
##	printf "    [-T|--textonly]               Force the ncurses menus off\n"
##
}

# Source a file based on a runtime parameter to allow extra FSPs and utilities
# to be added by the user.
source_additional_file()
{
	if [ "${OTHER_SOURCE_FILE}" ]; then
		if [ -f "${OTHER_SOURCE_FILE}" ]; then
			source "${OTHER_SOURCE_FILE}"
		else
			echo "Error: ${OTHER_SOURCE_FILE} is not valid"
			exit 0
		fi
	fi
}

parse_param()
{
# parse parameters.. try to find out whether we're running GNU getopt
	getoptbrand="$(getopt -V)"
	if [ "${getoptbrand:0:6}" == "getopt" ]; then
		# Detected GNU getopt that supports long options.
		args=$(getopt -o "Vhsi:aS:DnL" \
			-l "version,help,showall,install:,all,source:,download,nomd5,leave" \
			-- "$@" ) || exit 1
		eval set -- "$args";
	else
		# Detected non-GNU getopt
		args=$(getopt Vhsi:aS:DL "$*")
		set -- "$args"
	fi

	while true ; do
		case "$1" in
			-s|--showall)	shift; print_version; show_installs; exit 0;;
			-V|--version)	shift; print_version; exit 0;;
			-h|--help)	shift; print_version; show_help; exit 0;;

			-i|--install)	shift; FSPS_TO_INSTALL+="$1 "; shift;;
			-a|--all)	shift; RUN_ALL_INSTALLS=1; add_all_installs;;
			-S|--source)	shift; OTHER_SOURCE_FILE="$1"; shift; source_additional_file;;
			-D|--download)	shift; download_all_installs; exit 0;;
			-n|--nomd5)	shift; SKIP_MD5_CHECKSUM=1;;
			-L|--leave)	shift; LEAVE_FSP_INSTALL=1;;

			--)		shift; break;;
			-*)		printf "Invalid option\n\n"; show_help; exit 1;;
			*)		break;;
		esac
	done
}

initialize_tools()
{
	#set up tools
	dialog=$(which whiptail dialog 2> /dev/null)
	fetch=$(which curl 2> /dev/null || which wget 2> /dev/null)
	showtree=$(which tree 2> /dev/null || "ls -R")
	MD5SUM=$(which md5sum)
	CUT=$(which cut)
	if [ -z "$MD5SUM" ] || [ -z "$CUT" ]; then
		SKIP_MD5_CHECKSUM=1
	fi
}

#set up the global variables
UP_ONE_DIR=$(readlink -f "..")
INTEL_DIR="${UP_ONE_DIR}/intel"
INSTALL_FAILURE=0
FSPS_TO_INSTALL=""
FSP_PACKAGE_DIR="$INTEL_DIR/fsp_packages"

# See what operating system is being run - this determines the packages to download
detect_os

#set up variables for any tools used
initialize_tools

# Parse the command line options
parse_param "$@"

# run the menus if no installation was requested on the command line
if [ -z "${FSPS_TO_INSTALL}" ]; then
	choose_what_to_install
fi

run_selected_installs

echo
if [ "$INSTALL_FAILURE" = "0" ]; then
	echo "*** All FSPs or utilities installed successfully. ***"
else
	echo "*** Error: Not all FSPs/utilities installed successfully. ***"
fi

exit $INSTALL_FAILURE
