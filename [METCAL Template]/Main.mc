Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Agilent E3634A Calibration
DATE:                  2021-05-18 10:22:41
AUTHOR:                Antti Harala
REVISION:              1.1
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       55
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
# Add description and notes here. For example describe or list standards,
# manuals or certificates this program is based on.

# Call Preamble
  1.001  CALL         Sub Preamble

# User defined standards. Add if necessary. Adding under subprocedure preferred.
# STD

# Reset commands for instruments. Add always if UUT is stimulus instrument.
# Reset command does not require specific address if UUT is alone in bus 1.
# If using stimulus system instruments (standards) that are operated using
# SCPI / IEEE commands, you should add reset commands to the instruments
# WITH a specified address or alias (ie. RESET [@E3634A]OUTP OFF).
  1.002  RESET        OUTP OFF

# Main heading.
# If you are creating procedures for multiple instruments (multiple INSTRUMENT: lines in
# file header) you can use PROC() function to call the procedure name and use it in HEAD
# and RSLT functions.
  1.003  MATH         @dev_dame = PROC()
  1.004  HEAD         [V @dev_name]
  1.005  RSLT         =[V @devname]
  1.006  RSLT         =
  1.007  TARGET       -p

# First connection messages.
  1.008  DISP         Connect UUT to GPIB bus 1.

# Tag.Name = DC Voltage Calibration
# Tag.Start = START_DCV_CALIBRATION
# Tag.End = END_DCV_CALIBRATION

  1.009  LABEL        START_DCV_CALIBRATION

  1.010  RSLT         =DC Voltage Calibration
  1.011  TARGET       -p

# Divide procedure to subprocedures if necessary.
  1.012  CALL         Sub DCV Calibration

  1.013  LABEL        END_DCV_CALIBRATION

  1.014  END
