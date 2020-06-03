Pinja                                                       MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub DCV Calibration
DATE:                  2018-10-09 13:04:06
AUTHOR:                Antti Harala
REVISION:              1
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       5
NUMBER OF LINES:       38
CONFIGURATION:         Fluke 8842A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
# User defined standards. Add if necessary.
# STD

# For tests that require different settings use TSET command to apply it only to that test.

# When running compile check procedure and accuracy file does not have the required accuracy
# information the U1 must be set manually. Remember to normalize the standard's spec to 1 sigma
# when assigning TSET U1 = NNN.

# Nominal value significant digits indicates UUT resolution. UUT resolution is
# used in the uncertainty calculations.
  1.001  SCPI         APPL 1, 0.1; OUTP ON
  1.002  8842   1     1.000V         0.05% 1.0e-2U                         2W

  2.001  SCPI         APPL 2, 0.1; OUTP ON
  2.002  8842   2     2.000V         0.05% 1.0e-2U                         2W

  3.001  SCPI         APPL 3, 0.1; OUTP ON
  3.002  8842   3     3.000V         0.05% 1.0e-2U                         2W

  4.001  SCPI         APPL 4, 0.1; OUTP ON
  4.002  8842   4     4.000V         0.05% 1.0e-2U                         2W

  5.001  TSET         NMEAS = 5
  5.002  SCPI         APPL 5, 0.1; OUTP ON
  5.003  8842   20    5.000V         0.05% 1.0e-2U                         2W

# Tests with NMEAS = 1 require that U1 and U2 uncertainty components are calculated
# manually. These required at minimum: the standard's normalized accuracy (TSET U1),
# manually calculated TSET U2 = RSS2(S1,S2) = (RSS2(SDEV(N,N)/NMEAS,0.5*UUT_RES/sqrt(3)))
# and SYSTEM ACTUAL for evaluation statement MEM = AVG(1,10)

# Accuracies should be declared at the beginning of the test using descriptive variables and
# normalized to 1-sigma. The test below with NMEAS = 1 and manual calculation of U1 & U2 values
# from 10 measurements is identical to test 5.00X above. If possible avoid the NMEAS = 1 method
# NMEAS = 1 might be necessary in situations where measurement configuration is changed mid test
# to reverse leads to offset lead resistance etc.
  6.001  TSET         NMEAS = 1
  6.002  MATH         floor8842 = (3.75e-4)/2.58

  6.003  SCPI         APPL 5, 0.1; OUTP ON
  6.004  IEEE         [@8842]F1 R3 S0

  6.004  IEEE         [@8842]?[I]
  6.005  MATH         M[1] = MEM
  6.006  IEEE         [@8842]?[I]
  6.007  MATH         M[2] = MEM
  6.008  IEEE         [@8842]?[I]
  6.009  MATH         M[3] = MEM
  6.010  IEEE         [@8842]?[I]
  6.011  MATH         M[4] = MEM
  6.012  IEEE         [@8842]?[I]
  6.013  MATH         M[5] = MEM

  6.014  TSET         U1 = [V floor8842]
  6.015  MATH         MEM = RSS2(SDEV(1,5)/sqrt(5),(1e-3)/sqrt(3))
  6.016  TSET         U2 = [MEM]

  6.017  MATH         MEM = AVG(1,5)

# Although MEMC/MEMCX does *not* require units or unit prefix in the nominal field, the number
# fed to the MEMC/MEMCX evaluation (from MEM or MEM1) must be scaled to the same nominal value.
# For example "MEMC 0 0.000mV...." requires that MEM register values are scaled to millivolts.
# For readability use unit and unit prefix values in the evaluations.
  6.018  MEMC   20    5.000V         0.05% 1.0e-2U

# Preferred method when using direct SCPI commands instead of instrument FSCs is to define U1 manually
# and use TARGET -m command to specify jump destination for repeat measurements.
  7.001  TSET         NMEAS = 5
  7.002  MATH         floor8842 = (3.75e-4)/2.58
  7.003  TSET         U1 = [V floor8842]
  7.004  SCPI         APPL 5, 0.1; OUTP ON
  7.005  TARGET       -m
  7.006  IEEE         [@8842]F1 R3 S0

# Resulting units are determined by the instrument FSC's used in the test. If the resulting instrument
# FSC has units that do not represent the actual units in the final evaluation, you can enclose the
# MEMC/MEMCX units with '' to force units to that value (seen properly in the final calibration
# results without the '' markers).
  7.007  MEMC   20    5.000'V'       0.05% 1.0e-2U

  8.001  END

