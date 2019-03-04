#/******************************************************************************
#*
#* Copyright (C) 2018-2019 Xilinx, Inc.  All rights reserved.
#*
#* Permission is hereby granted, free of charge, to any person obtaining a copy
#* of this software and associated documentation files (the "Software"), to deal
#* in the Software without restriction, including without limitation the rights
#* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#* copies of the Software, and to permit persons to whom the Software is
#* furnished to do so, subject to the following conditions:
#*
#* The above copyright notice and this permission notice shall be included in
#* all copies or substantial portions of the Software.
#*
#* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
#* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#* SOFTWARE.
#*
#* Except as contained in this notice, the name of the Xilinx shall not be used
#* in advertising or otherwise to promote the sale, use or other dealings in
#* this Software without prior written authorization from Xilinx.
#*
#******************************************************************************/
#
# Modification History
#
# Ver   Who  Date     Changes
# ----- ---- -------- -----------------------------------------------
# 1.00  pc   01/21/19 Initial creation
##############################################################################

#---------------------------------------------
# sem_drc
#---------------------------------------------
proc sem_drc {libhandle} {


}

proc generate {libhandle} {
## TODO: see xilmfs.tcl for example of how to add #define to a .h based on configuration info
## TODO: see xillibpm.tcl for example of how to conditionally copy a set of files as src (we will do this based on configuration)
}


#-------
# post_generate: called after generate called on all libraries
#-------
proc post_generate {libhandle} {
	xgen_opts_file $libhandle
}

#-------
# execs_generate: called after BSP's, libraries and drivers have been compiled
#-------
proc execs_generate {libhandle} {

}

proc xgen_opts_file {libhandle} {

	# Copy the include files to the include directory
	set srcdir src
	set dstdir [file join .. .. include]

	# Create dstdir if it does not exist
	if { ! [file exists $dstdir] } {
		file mkdir $dstdir
	}

	# Get list of files in the srcdir
	set sources [glob -join $srcdir *.h]

	# Copy each of the files in the list to dstdir
	foreach source $sources {
		file copy -force $source $dstdir
	}

#	# Copy the include files to the include directory
#	set xsem_cfrSrcDir "./src/cframe"
#	set xsem_commonSrcDir "./src/common"
#	set dstdir [file join .. .. include]
#
#	# Create dstdir if it does not exist
#	if { ! [file exists $dstdir] } {
#		file mkdir $dstdir
#	}
#
#	# Get list of files in the srcdir
#	set sources [glob -join $xsem_cfrSrcDir *.h]
#
#	# Copy each of the files in the list to dstdir
#	foreach source $sources {
#		file copy -force $source $dstdir
#        }
#
#	# Get list of files in the srcdir
#	set sources [glob -join $xsem_commonSrcDir *.h]
#
#	# Copy each of the files in the list to dstdir
#	foreach source $sources {
#		file copy -force $source $dstdir
#	}

}
