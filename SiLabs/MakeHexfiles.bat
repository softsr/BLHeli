@ECHO on
rem ***** Batch file for BlHeli (from 4712) ****

rem ***** adapt settings to your enviroment ****
DEL Output\Hex\*.* /Q
RMDIR Output\Hex
DEL Output\*.* /Q
RMDIR Output
MKDIR Output
MKDIR Output\Hex
SET Revision=Rev7_0
SET SilabsPath=C:\SiLabs
SET RaisonancePath=C:\Raisonance
rem**** no changes anymore *********************
rem XP_3A_MAIN 		 	1
rem XP_3A_TAIL 		 	2
rem XP_3A_MULTI 		3
rem XP_7A_MAIN 		 	4
rem XP_7A_TAIL 		 	5
rem XP_7A_MULTI 		6
rem XP_7A_Fast_MAIN 		7
rem XP_7A_Fast_TAIL 	 	8
rem XP_7A_Fast_MULTI 		9
rem XP_12A_MAIN 	 	10
rem XP_12A_TAIL 	 	11
rem XP_12A_MULTI 	 	12
rem XP_18A_MAIN 	 	13
rem XP_18A_TAIL 	 	14
rem XP_18A_MULTI 	 	15
rem XP_25A_MAIN 	 	16
rem XP_25A_TAIL 	 	17
rem XP_25A_MULTI 	 	18
rem DP_3A_MAIN	 	 	19
rem DP_3A_TAIL  	 	20
rem DP_3A_MULTI  	 	21
rem Supermicro_3p5A_MAIN 	22
rem Supermicro_3p5A_TAIL 	23  
rem Supermicro_3p5A_MULTI 	24  
rem Turnigy_Plush_6A_MAIN  	25
rem Turnigy_Plush_6A_TAIL  	26  
rem Turnigy_Plush_6A_MULTI  	27 
rem Turnigy_Plush_10A_MAIN  	28
rem Turnigy_Plush_10A_TAIL  	29  
rem Turnigy_Plush_10A_MULTI  	30 
rem Turnigy_Plush_12A_MAIN  	31
rem Turnigy_Plush_12A_TAIL  	32  
rem Turnigy_Plush_12A_MULTI  	33 
rem Turnigy_Plush_18A_MAIN  	34
rem Turnigy_Plush_18A_TAIL  	35 
rem Turnigy_Plush_18A_MULTI  	36 
rem Turnigy_Plush_25A_MAIN  	37
rem Turnigy_Plush_25A_TAIL  	38  
rem Turnigy_Plush_25A_MULTI  	39 
rem Turnigy_Plush_30A_MAIN  	40
rem Turnigy_Plush_30A_TAIL  	41  
rem Turnigy_Plush_30A_MULTI  	42 
rem Turnigy_AE_20A_MAIN  	43
rem Turnigy_AE_20A_TAIL  	44  
rem Turnigy_AE_20A_MULTI  	45 
rem Turnigy_AE_25A_MAIN  	46
rem Turnigy_AE_25A_TAIL  	47  
rem Turnigy_AE_25A_MULTI  	48 
rem Turnigy_AE_30A_MAIN  	49
rem Turnigy_AE_30A_TAIL  	50  
rem Turnigy_AE_30A_MULTI  	51 
rem Skywalker_20A_MAIN  	52
rem Skywalker_20A_TAIL  	53  
rem Skywalker_20A_MULTI  	54 
rem Skywalker_40A_MAIN  	55
rem Skywalker_40A_TAIL  	56  
rem Skywalker_40A_MULTI  	57 

SET BESCTYPE=XP_3A_MAIN
SET BESC=1
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_3A_TAIL
SET BESC=2
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_3A_MULTI
SET BESC=3
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_7A_MAIN
SET BESC=4
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_7A_TAIL
SET BESC=5
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_7A_MULTI
SET BESC=6
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_7A_Fast_MAIN
SET BESC=7
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_7A_Fast_TAIL
SET BESC=8
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_7A_Fast_MULTI
SET BESC=9
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_12A_MAIN
SET BESC=10
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_12A_TAIL
SET BESC=11
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_12A_MULTI
SET BESC=12
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_18A_MAIN
SET BESC=13
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_18A_TAIL
SET BESC=14
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_18A_MULTI
SET BESC=15
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_25A_MAIN
SET BESC=16
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_25A_TAIL
SET BESC=17
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=XP_25A_MULTI
SET BESC=18
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=DP_3A_MAIN
SET BESC=19
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=DP_3A_TAIL
SET BESC=20
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=DP_3A_MULTI
SET BESC=21
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Supermicro_3p5A_MAIN
SET BESC=22
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Supermicro_3p5A_TAIL
SET BESC=23
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Supermicro_3p5A_MULTI
SET BESC=24
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_6A_MAIN
SET BESC=25
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_6A_TAIL
SET BESC=26
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_6A_MULTI
SET BESC=27
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_10A_MAIN
SET BESC=28
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_10A_TAIL
SET BESC=29
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_10A_MULTI
SET BESC=30
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_12A_MAIN
SET BESC=31
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_12A_TAIL
SET BESC=32
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_12A_MULTI
SET BESC=33
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_18A_MAIN
SET BESC=34
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_18A_TAIL
SET BESC=35
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_18A_MULTI
SET BESC=36
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_25A_MAIN
SET BESC=37
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_25A_TAIL
SET BESC=38
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_25A_MULTI
SET BESC=39
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_30A_MAIN
SET BESC=40
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_30A_TAIL
SET BESC=41
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_Plush_30A_MULTI
SET BESC=42
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_AE_20_MAIN
SET BESC=43
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_AE_20_TAIL
SET BESC=44
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_AE_20_MULTI
SET BESC=45
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_AE_25_MAIN
SET BESC=46
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_AE_25_TAIL
SET BESC=47
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_AE_25_MULTI
SET BESC=48
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_AE_30_MAIN
SET BESC=49
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_AE_30_TAIL
SET BESC=50
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Turnigy_AE_30_MULTI
SET BESC=51
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Skywalker_20_MAIN
SET BESC=52
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Skywalker_20_TAIL
SET BESC=53
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Skywalker_20_MULTI
SET BESC=54
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Skywalker_40_MAIN
SET BESC=55
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Skywalker_40_TAIL
SET BESC=56
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"

SET BESCTYPE=Skywalker_40_MULTI
SET BESC=57
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF"
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*"
del "Output\%BESCTYPE%_%Revision%.HEX"


@Echo OFF
SET SilabsPath=
SET RaisonancePath=
SET BESCTYPE=
SET BESC=