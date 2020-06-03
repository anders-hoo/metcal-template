K013                                                        MET/CAL Procedure
=============================================================================
INSTRUMENT:            Agilent E3634A Calibration
DATE:                  2018-10-23 12:36:53
AUTHOR:                Antti Harala
REVISION:              1.1
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       46
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
  1.003  HEAD         {Agilent E3634A Calibration}
  1.004  RSLT         =
  1.005  TARGET       -p

# First connection messages.
  1.006  DISP         Connect UUT to GPIB bus 1.

# Tag.Name = DC Voltage Calibration
# Tag.Start = START_DCV_CALIBRATION
# Tag.End = END_DCV_CALIBRATION

  1.007  LABEL        START_DCV_CALIBRATION

  1.008  RSLT         =DC Voltage Calibration
  1.009  TARGET       -p

# Divide procedure to subprocedures if necessary.
  1.010  CALL         Sub DCV Calibration

  1.011  LABEL        END_DCV_CALIBRATION

  1.012  END
