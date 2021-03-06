;**** **** **** **** ****
;
; BLHeli program for controlling brushless motors in helicopters
;
; Copyright 2011, 2012 Steffen Skaug
; This program is distributed under the terms of the GNU General Public License
;
; This file is part of BLHeli.
;
; BLHeli is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; BLHeli is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with BLHeli.  If not, see <http://www.gnu.org/licenses/>.
;
;**** **** **** **** ****
;
; BLHeliTxPgm SiLabs                                      
;                                                         
; EEPROM is not available in SiLabs MCUs                  
; Therefore a segment of the flash is used as "EEPROM"    
;                                                         
;**** **** **** **** ****


;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Read eeprom byte routine
;
; Gives data in A and in address given by Temp1. Assumes address in DPTR 
; Also assumes address high byte to be zero
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
read_eeprom_byte:
	clr	A
	movc	A, @A+DPTR			; Read from flash
	mov	@Temp1, A
	ret


;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Write eeprom byte routine
;
; Assumes data in address given by Temp1, or in accumulator. Assumes address in DPTR 
; Also assumes address high byte to be zero
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
write_eeprom_byte:
	mov	A, @Temp1
write_eeprom_byte_from_acc:
	orl	PSCTL, #01h			; Set the PSWE bit
	anl	PSCTL, #0FDh			; Clear the PSEE bit
	mov 	RSTSRC, #02h   		; Set VDD monitor as a reset source (PORSF)                                
	mov	FLKEY, #0A5h			; First key code
	mov	FLKEY, #0F1h			; Second key code
	movx	@DPTR, A				; Write to flash
	anl	PSCTL, #0FEh			; Clear the PSWE bit
	ret


;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Erase flash routine (erases the flash segment used for "eeprom" variables)
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
erase_flash:	
	orl	PSCTL, #02h			; Set the PSEE bit
	orl	PSCTL, #01h			; Set the PSWE bit
	mov 	RSTSRC, #02h   		; Set VDD monitor as a reset source (PORSF)                                
	mov	FLKEY, #0A5h			; First key code
	mov	FLKEY, #0F1h			; Second key code
	mov	DPTR, #Eep_Initialized_L	
	movx	@DPTR, A
	anl	PSCTL, #0FCh			; Clear the PSEE and PSWE bits
	ret


;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Write eeprom signature routine
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
write_eeprom_signature:	
IF MODE == 0
	mov	DPTR, #Eep_Initialized_L
	mov	A, #0A5h
	call write_eeprom_byte_from_acc

	mov	DPTR, #Eep_Initialized_H
	mov	A, #05Ah
	call write_eeprom_byte_from_acc
ENDIF
IF MODE == 1
	mov	DPTR, #Eep_Initialized_L
	mov	A, #05Ah
	call write_eeprom_byte_from_acc

	mov	DPTR, #Eep_Initialized_H
	mov	A, #0A5h
	call write_eeprom_byte_from_acc
ENDIF
IF MODE == 2
	mov	DPTR, #Eep_Initialized_L
	mov	A, #055h
	call write_eeprom_byte_from_acc

	mov	DPTR, #Eep_Initialized_H
	mov	A, #0AAh
	call write_eeprom_byte_from_acc
ENDIF
	ret

;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Read all eeprom perameters routine
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
read_all_eeprom_parameters:	
IF MODE == 0
	; Check initialized signature
	mov	DPTR, #Eep_Initialized_L
	mov	Temp1, #Bit_Access
	call read_eeprom_byte
	mov	A, Bit_Access
	clr	C
	subb	A, #0A5h
	jz	($+5)
	ljmp	read_eeprom_store_defaults

	mov	DPTR, #Eep_Initialized_H
	mov	Temp1, #Bit_Access
	call read_eeprom_byte
	mov	A, Bit_Access
	clr	C
	subb	A, #05Ah
	jz	($+5)
	ljmp	read_eeprom_store_defaults

	; Read eeprom
	mov	DPTR, #Eep_Pgm_Gov_P_Gain
	mov	Temp1, #Pgm_Gov_P_Gain	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Gov_I_Gain
	mov	Temp1, #Pgm_Gov_I_Gain	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Gov_Mode
	mov	Temp1, #Pgm_Gov_Mode	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Gov_Range
	mov	Temp1, #Pgm_Gov_Range	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Low_Voltage_Lim
	mov	Temp1, #Pgm_Low_Voltage_Lim	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Pwr
	mov	Temp1, #Pgm_Startup_Pwr	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Rpm
	mov	Temp1, #Pgm_Startup_Rpm	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Accel
	mov	Temp1, #Pgm_Startup_Accel	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Comm_Timing
	mov	Temp1, #Pgm_Comm_Timing	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Throttle_Rate
	mov	Temp1, #Pgm_Throttle_Rate	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Damping_Force
	mov	Temp1, #Pgm_Damping_Force	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Pwm_Freq
	mov	Temp1, #Pgm_Pwm_Freq	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Volt_Comp
	mov	Temp1, #Pgm_Volt_Comp	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Direction_Rev
	mov	Temp1, #Pgm_Direction_Rev	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Input_Pol
	mov	Temp1, #Pgm_Input_Pol	
	call read_eeprom_byte

	mov	DPTR, #Eep_Main_Rearm_Start
	mov	Temp1, #Pgm_Main_Rearm_Start	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Gov_Setup_Target
	mov	Temp1, #Pgm_Gov_Setup_Target	
	call read_eeprom_byte
ENDIF
IF MODE == 1
	; Check initialized signature
	mov	DPTR, #Eep_Initialized_L
	mov	Temp1, #Bit_Access
	call read_eeprom_byte
	mov	A, Bit_Access
	clr	C
	subb	A, #05Ah
	jz	($+5)
	ljmp	read_eeprom_store_defaults

	mov	DPTR, #Eep_Initialized_H
	mov	Temp1, #Bit_Access
	call read_eeprom_byte
	mov	A, Bit_Access
	clr	C
	subb	A, #0A5h
	jz	($+5)
	ljmp	read_eeprom_store_defaults

	; Read eeprom
	mov	DPTR, #Eep_Pgm_Motor_Gain
	mov	Temp1, #Pgm_Motor_Gain	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Motor_Idle
	mov	Temp1, #Pgm_Motor_Idle	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Pwr
	mov	Temp1, #Pgm_Startup_Pwr	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Rpm
	mov	Temp1, #Pgm_Startup_Rpm	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Accel
	mov	Temp1, #Pgm_Startup_Accel	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Comm_Timing
	mov	Temp1, #Pgm_Comm_Timing	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Throttle_Rate
	mov	Temp1, #Pgm_Throttle_Rate	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Damping_Force
	mov	Temp1, #Pgm_Damping_Force	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Pwm_Freq
	mov	Temp1, #Pgm_Pwm_Freq	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Volt_Comp
	mov	Temp1, #Pgm_Volt_Comp	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Direction_Rev
	mov	Temp1, #Pgm_Direction_Rev	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Input_Pol
	mov	Temp1, #Pgm_Input_Pol	
	call read_eeprom_byte

	mov	Temp1, #Pgm_Gov_Mode	
	mov	@Temp1, #4
ENDIF
IF MODE == 2
	; Check initialized signature
	mov	DPTR, #Eep_Initialized_L
	mov	Temp1, #Bit_Access
	call read_eeprom_byte
	mov	A, Bit_Access
	clr	C
	subb	A, #055h
	jz	($+5)
	ljmp	read_eeprom_store_defaults

	mov	DPTR, #Eep_Initialized_H
	mov	Temp1, #Bit_Access
	call read_eeprom_byte
	mov	A, Bit_Access
	clr	C
	subb	A, #0AAh
	jz	($+5)
	ljmp	read_eeprom_store_defaults

	; Read eeprom
	mov	DPTR, #Eep_Pgm_Motor_Gain
	mov	Temp1, #Pgm_Motor_Gain	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Low_Voltage_Lim
	mov	Temp1, #Pgm_Low_Voltage_Lim	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Pwr
	mov	Temp1, #Pgm_Startup_Pwr	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Rpm
	mov	Temp1, #Pgm_Startup_Rpm	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Accel
	mov	Temp1, #Pgm_Startup_Accel	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Comm_Timing
	mov	Temp1, #Pgm_Comm_Timing	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Throttle_Rate
	mov	Temp1, #Pgm_Throttle_Rate	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Damping_Force
	mov	Temp1, #Pgm_Damping_Force	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Pwm_Freq
	mov	Temp1, #Pgm_Pwm_Freq	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Volt_Comp
	mov	Temp1, #Pgm_Volt_Comp	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Direction_Rev
	mov	Temp1, #Pgm_Direction_Rev	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Input_Pol
	mov	Temp1, #Pgm_Input_Pol	
	call read_eeprom_byte

	mov	Temp1, #Pgm_Gov_Mode	
	mov	@Temp1, #4
ENDIF

	mov	DPTR, #Eep_Pgm_Ppm_Min_Throttle
	mov	Temp1, #Pgm_Ppm_Min_Throttle	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Ppm_Max_Throttle
	mov	Temp1, #Pgm_Ppm_Max_Throttle	
	call read_eeprom_byte

	mov	DPTR, #Eep_Enable_TX_Program
	mov	Temp1, #Pgm_Enable_TX_Program	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Beep_Strength
	mov	Temp1, #Pgm_Beep_Strength	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Beacon_Strength
	mov	Temp1, #Pgm_Beacon_Strength	
	call read_eeprom_byte

	mov	DPTR, #Eep_Pgm_Beacon_Delay
	mov	Temp1, #Pgm_Beacon_Delay	
	call read_eeprom_byte

	mov	DPTR, #Eep_Dummy 			; Set pointer to uncritical area

	jmp	read_eeprom_exit

read_eeprom_store_defaults:
	call set_default_parameters	
	call erase_and_store_all_in_eeprom	
read_eeprom_exit:
	ret


;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Read all tags from flash and store in temporary storage
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
read_tags:
	mov	Temp3, #48				; Number of tags
	mov	Temp2, #Tag_Temporary_Storage	; Set RAM address
	mov	Temp1, #Bit_Access
	mov	DPTR, #Eep_ESC_Layout		; Set flash address
read_tag:	
	call read_eeprom_byte
	mov	A, Bit_Access
	mov	@Temp2, A			; Write to RAM
	inc	Temp2
	inc	DPTR
	djnz Temp3, read_tag	
	ret


;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Write all tags from temporary storage and store in flash
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
write_tags:
	mov	Temp3, #48				; Number of tags
	mov	Temp2, #Tag_Temporary_Storage	; Set RAM address
	mov	DPTR, #Eep_ESC_Layout		; Set flash address
write_tag:	
	mov	A, @Temp2			; Read from RAM
	call write_eeprom_byte_from_acc
	inc	Temp2
	inc	DPTR
	djnz Temp3, write_tag	
	ret


;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Erase flash and store all parameter value in EEPROM routine
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
erase_and_store_all_in_eeprom:
	clr	EA						; Disable interrupts
	call	read_tags
	call	erase_flash				; Erase flash

	mov	DPTR, #Eep_FW_Main_Revision	; Store firmware main revision
	mov	A, #EEPROM_FW_MAIN_REVISION
	call write_eeprom_byte_from_acc

	mov	DPTR, #Eep_FW_Sub_Revision	; Store firmware sub revision
	mov	A, #EEPROM_FW_SUB_REVISION
	call write_eeprom_byte_from_acc

	mov	DPTR, #Eep_Layout_Revision	; Store EEPROM layout revision
	mov	A, #EEPROM_LAYOUT_REVISION
	call write_eeprom_byte_from_acc

IF MODE == 0
	mov	DPTR, #Eep_Pgm_Gov_P_Gain
	mov	Temp1, #Pgm_Gov_P_Gain
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Gov_I_Gain
	mov	Temp1, #Pgm_Gov_I_Gain
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Gov_Mode
	mov	Temp1, #Pgm_Gov_Mode
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Gov_Range
	mov	Temp1, #Pgm_Gov_Range
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Low_Voltage_Lim
	mov	Temp1, #Pgm_Low_Voltage_Lim
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Pwr
	mov	Temp1, #Pgm_Startup_Pwr
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Rpm
	mov	Temp1, #Pgm_Startup_Rpm
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Accel
	mov	Temp1, #Pgm_Startup_Accel
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Comm_Timing
	mov	Temp1, #Pgm_Comm_Timing
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Throttle_Rate
	mov	Temp1, #Pgm_Throttle_Rate
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Damping_Force
	mov	Temp1, #Pgm_Damping_Force
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Pwm_Freq
	mov	Temp1, #Pgm_Pwm_Freq
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Volt_Comp
	mov	Temp1, #Pgm_Volt_Comp
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Direction_Rev
	mov	Temp1, #Pgm_Direction_Rev
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Input_Pol
	mov	Temp1, #Pgm_Input_Pol
	call write_eeprom_byte

	mov	DPTR, #Eep_Main_Rearm_Start
	mov	Temp1, #Pgm_Main_Rearm_Start
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Gov_Setup_Target
	mov	Temp1, #Pgm_Gov_Setup_Target
	call write_eeprom_byte
ENDIF
IF MODE == 1
	mov	DPTR, #Eep_Pgm_Motor_Gain
	mov	Temp1, #Pgm_Motor_Gain
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Motor_Idle
	mov	Temp1, #Pgm_Motor_Idle
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Pwr
	mov	Temp1, #Pgm_Startup_Pwr
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Rpm
	mov	Temp1, #Pgm_Startup_Rpm
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Accel
	mov	Temp1, #Pgm_Startup_Accel
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Damping_Force
	mov	Temp1, #Pgm_Damping_Force
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Comm_Timing
	mov	Temp1, #Pgm_Comm_Timing
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Throttle_Rate
	mov	Temp1, #Pgm_Throttle_Rate
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Pwm_Freq
	mov	Temp1, #Pgm_Pwm_Freq
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Volt_Comp
	mov	Temp1, #Pgm_Volt_Comp
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Direction_Rev
	mov	Temp1, #Pgm_Direction_Rev
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Input_Pol
	mov	Temp1, #Pgm_Input_Pol
	call write_eeprom_byte
ENDIF
IF MODE == 2
	mov	DPTR, #Eep_Pgm_Motor_Gain
	mov	Temp1, #Pgm_Motor_Gain
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Low_Voltage_Lim
	mov	Temp1, #Pgm_Low_Voltage_Lim
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Pwr
	mov	Temp1, #Pgm_Startup_Pwr
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Rpm
	mov	Temp1, #Pgm_Startup_Rpm
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Accel
	mov	Temp1, #Pgm_Startup_Accel
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Startup_Method
	mov	Temp1, #Pgm_Startup_Method
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Comm_Timing
	mov	Temp1, #Pgm_Comm_Timing
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Throttle_Rate
	mov	Temp1, #Pgm_Throttle_Rate
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Damping_Force
	mov	Temp1, #Pgm_Damping_Force
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Pwm_Freq
	mov	Temp1, #Pgm_Pwm_Freq
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Volt_Comp
	mov	Temp1, #Pgm_Volt_Comp
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Direction_Rev
	mov	Temp1, #Pgm_Direction_Rev
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Input_Pol
	mov	Temp1, #Pgm_Input_Pol
	call write_eeprom_byte
ENDIF

	mov	DPTR, #Eep_Pgm_Ppm_Min_Throttle
	mov	Temp1, #Pgm_Ppm_Min_Throttle
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Ppm_Max_Throttle
	mov	Temp1, #Pgm_Ppm_Max_Throttle
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Beep_Strength
	mov	Temp1, #Pgm_Beep_Strength
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Beacon_Strength
	mov	Temp1, #Pgm_Beacon_Strength
	call write_eeprom_byte

	mov	DPTR, #Eep_Pgm_Beacon_Delay
	mov	Temp1, #Pgm_Beacon_Delay
	call write_eeprom_byte

	mov	DPTR, #Eep_Enable_TX_Program
	mov	Temp1, #Pgm_Enable_TX_Program
	call write_eeprom_byte

	call	write_tags
	call write_eeprom_signature
	mov	DPTR, #Eep_Dummy 			; Set pointer to uncritical area
	ret	



;**** **** **** **** **** **** **** **** **** **** **** **** ****
CSEG AT 1C00h		; Last code segment. Take care that there is enough space!
;**** **** **** **** **** **** **** **** **** **** **** **** ****


;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Store new parameter value in ram routine
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
store_new_value_in_ram:	
	mov	Temp4, Tx_Pgm_Func_No	; Function no
	mov	Temp1, Tx_Pgm_Paraval_No	; Parameter value no
IF MODE == 0
store_main_func_1:
	cjne	Temp4, #1, store_main_func_2
	mov	Temp2, #Pgm_Gov_P_Gain
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_2:
	cjne	Temp4, #2, store_main_func_3
	mov	Temp2, #Pgm_Gov_I_Gain
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_3:
	cjne	Temp4, #3, store_main_func_4
	mov	Temp2, #Pgm_Gov_Mode
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_4:
	cjne	Temp4, #4, store_main_func_5
	mov	Temp2, #Pgm_Gov_Range
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_5:
	cjne	Temp4, #5, store_main_func_6
	mov	Temp2, #Pgm_Low_Voltage_Lim
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_6:
	cjne	Temp4, #6, store_main_func_7
	mov	Temp2, #Pgm_Startup_Method
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_7:
	cjne	Temp4, #7, store_main_func_8
	mov	Temp2, #Pgm_Startup_Pwr
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_8:
	cjne	Temp4, #8, store_main_func_9
	mov	Temp2, #Pgm_Startup_Rpm
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_9:
	cjne	Temp4, #9, store_main_func_10
	mov	Temp2, #Pgm_Startup_Accel
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_10:
	cjne	Temp4, #10, store_main_func_11
	mov	Temp2, #Pgm_Comm_Timing
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_11:
	cjne	Temp4, #11, store_main_func_12
	mov	Temp2, #Pgm_Throttle_Rate
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_12:
	cjne	Temp4, #12, store_main_func_13
	mov	Temp2, #Pgm_Damping_Force
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_13:
	cjne	Temp4, #13, store_main_func_14
	mov	Temp2, #Pgm_Pwm_Freq
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_14:
	cjne	Temp4, #14, store_main_func_15
	mov	Temp2, #Pgm_Volt_Comp
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_15:
	cjne	Temp4, #15, store_main_func_16
	mov	Temp2, #Pgm_Direction_Rev
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_main_func_16:
	mov	Temp2, #Pgm_Input_Pol
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit
ENDIF
IF MODE == 1
store_tail_func_1:
	cjne	Temp4, #1, store_tail_func_2
	mov	Temp2, #Pgm_Motor_Gain
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_2:
	cjne	Temp4, #2, store_tail_func_3
	mov	Temp2, #Pgm_Motor_Idle
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_3:
	cjne	Temp4, #3, store_tail_func_4
	mov	Temp2, #Pgm_Startup_Method
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_4:
	cjne	Temp4, #4, store_tail_func_5
	mov	Temp2, #Pgm_Startup_Pwr
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_5:
	cjne	Temp4, #5, store_tail_func_6
	mov	Temp2, #Pgm_Startup_Rpm
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_6:
	cjne	Temp4, #6, store_tail_func_7
	mov	Temp2, #Pgm_Startup_Accel
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_7:
	cjne	Temp4, #7, store_tail_func_8
	mov	Temp2, #Pgm_Comm_Timing
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_8:
	cjne	Temp4, #8, store_tail_func_9
	mov	Temp2, #Pgm_Throttle_Rate
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_9:
	cjne	Temp4, #9, store_tail_func_10
	mov	Temp2, #Pgm_Damping_Force
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_10:
	cjne	Temp4, #10, store_tail_func_11
	mov	Temp2, #Pgm_Pwm_Freq
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_11:
	cjne	Temp4, #11, store_tail_func_12
	mov	Temp2, #Pgm_Volt_Comp
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_12:
	cjne	Temp4, #12, store_tail_func_13
	mov	Temp2, #Pgm_Direction_Rev
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_tail_func_13:
	mov	Temp2, #Pgm_Input_Pol
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit
ENDIF
IF MODE == 2
store_multi_func_1:
	cjne	Temp4, #1, store_multi_func_2
	mov	Temp2, #Pgm_Motor_Gain
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_2:
	cjne	Temp4, #2, store_multi_func_3
	mov	Temp2, #Pgm_Low_Voltage_Lim
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_3:
	cjne	Temp4, #3, store_multi_func_4
	mov	Temp2, #Pgm_Startup_Method
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_4:
	cjne	Temp4, #4, store_multi_func_5
	mov	Temp2, #Pgm_Startup_Pwr
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_5:
	cjne	Temp4, #5, store_multi_func_6
	mov	Temp2, #Pgm_Startup_Rpm
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_6:
	cjne	Temp4, #6, store_multi_func_7
	mov	Temp2, #Pgm_Startup_Accel
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_7:
	cjne	Temp4, #7, store_multi_func_8
	mov	Temp2, #Pgm_Comm_Timing
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_8:
	cjne	Temp4, #8, store_multi_func_9
	mov	Temp2, #Pgm_Throttle_Rate
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_9:
	cjne	Temp4, #9, store_multi_func_10
	mov	Temp2, #Pgm_Damping_Force
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_10:
	cjne	Temp4, #10, store_multi_func_11
	mov	Temp2, #Pgm_Pwm_Freq
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_11:
	cjne	Temp4, #11, store_multi_func_12
	mov	Temp2, #Pgm_Volt_Comp
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_12:
	cjne	Temp4, #12, store_multi_func_13
	mov	Temp2, #Pgm_Direction_Rev
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit

store_multi_func_13:
	mov	Temp2, #Pgm_Input_Pol
	mov	A, Temp1
	mov	@Temp2, A
	jmp	store_in_ram_exit
ENDIF

store_in_ram_exit:
	ret


;**;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Wait 1 second routine
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
wait1s:
	mov	Temp5, #5
wait1s_loop:
	call wait200ms
	djnz	Temp5, wait1s_loop
	ret


;**;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Success beep routine
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
success_beep:
	clr	EA					; Disable all interrupts
	call beep_f1
	call beep_f2
	call beep_f3
	call beep_f4
	call wait10ms
	call beep_f1
	call beep_f2
	call beep_f3
	call beep_f4
	call wait10ms
	call beep_f1
	call beep_f2
	call beep_f3
	call beep_f4
	setb	EA					; Enable all interrupts
	ret


;**;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Success beep inverted routine
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
success_beep_inverted:
	clr	EA					; Disable all interrupts
	call beep_f4
	call beep_f3
	call beep_f2
	call beep_f1
	call wait10ms
	call beep_f4
	call beep_f3
	call beep_f2
	call beep_f1
	call wait10ms
	call beep_f4
	call beep_f3
	call beep_f2
	call beep_f1
	setb	EA					; Enable all interrupts
	ret


;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Function and parameter value beep routine
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
function_paraval_beep:
	mov	Temp7, Tx_Pgm_Func_No	; Function no
	mov	Temp8, Tx_Pgm_Paraval_No	; Parameter value no
	clr	EA					; Disable all interrupts
function_beep:
	call beep_f1				
	call beep_f1
	call beep_f1
	call wait10ms
	djnz	Temp7, function_beep
paraval_beep:
	call beep_f4
	call wait10ms
	djnz	Temp8, paraval_beep
	setb	EA					; Enable all interrupts
	ret


;**** **** **** **** **** **** **** **** **** **** **** **** ****
;
; Program by TX routine
;
; No assumptions
;
;**** **** **** **** **** **** **** **** **** **** **** **** ****
program_by_tx:	
	; Programming mode entry beeps
	call success_beep
	call wait1s
	call wait1s

	; Start at function 1, parameter value 1
	mov	Tx_Pgm_Func_No, #1
paraval_no_entry:
	mov	Tx_Pgm_Paraval_No, #1
beep_no_entry:
	mov	Tx_Pgm_Beep_No, #0
func_paraval:
	call function_paraval_beep
	mov	Temp5, #5				; Wait is 5x 200ms
func_paraval_wait:
	mov	Temp6, New_Rcp			; Store RC pulse
	call wait200ms
	clr	C
	mov	A, Temp6
	subb	A, New_Rcp			; Is RC pulse stable? (Avoid issues from 3in1 interference)
	jnz	func_paraval_wait		; No - branch
	clr	C
	mov	A, New_Rcp			; Load new RC pulse value
	subb	A, #RCP_STOP			; Below stop?
	jc	func_paraval_store		; Yes - branch

	clr	C
	mov	A, New_Rcp			; Load new RC pulse value
	subb	A, #RCP_MAX			; Below max?
	jc	function_next			; Yes - branch

	ajmp	func_paraval_cont_wait	; No - branch

func_paraval_store:
	call	store_new_value_in_ram		; Yes - store new value in RAM
	call	erase_and_store_all_in_eeprom	; Store all values in EEPROM
	call success_beep			; Beep success
	clr	EA					; Disable all interrupts
	mov 	RSTSRC, #00h   		; Clear VDD monitor as a reset source (PORSF)                                
	orl	RSTSRC, #10h			; Generate hardware reset
	call wait1s

func_paraval_cont_wait:
	djnz	Temp5, func_paraval_wait
	inc	Tx_Pgm_Beep_No			; Check number of beeps
	clr	C
	mov	A, Tx_Pgm_Beep_No		
	subb	A, #3				; Three beeps done?
	jnc	paraval_next			; Yes - Next parameter value

	jmp	func_paraval			; No - go back

paraval_next:					
	call wait1s
	inc	Tx_Pgm_Paraval_No		; Parameter value no
	mov	Temp1, #5				; Default 5 parameter values
IF MODE == 0
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #3				; Function 3?
	jnz	paraval_end_a			; No - branch
	mov	Temp1, #4				; Yes - set max parameter values
	ajmp	paraval_end_e
paraval_end_a:
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #4				; Function 4?
	jnz	paraval_end_b			; No - branch
	mov	Temp1, #2				; Yes - set max parameter values
	ajmp	paraval_end_f
paraval_end_b:
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #6				; Function 6?
	jnz	paraval_end_c			; No - branch
	mov	Temp1, #2				; Yes - set max parameter values
	ajmp	paraval_end_f
paraval_end_c:
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #11				; Function 11?
	jnz	paraval_end_d			; No - branch
	mov	Temp1, #13			; Yes - set max parameter values
	ajmp	paraval_end_g
paraval_end_d:
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #13				; Function 13?
	jnz	paraval_end_e			; No - branch
	mov	Temp1, #3				; Yes - set max parameter values
	ajmp	paraval_end_g
paraval_end_e:
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #13				; Function below 13?
	jc 	paraval_end_f			; Yes - branch
	mov	Temp1, #2				; No - set max parameter values
paraval_end_f:
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #3				; Function below 3?
	jnc 	paraval_end_g			; No - branch
	mov	Temp1, #13			; Yes - set max parameter values
paraval_end_g:
ENDIF
IF MODE >= 1
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #10				; Function below 10?
	jc 	paraval_end_a			; Yes - branch
	mov	Temp1, #(3+DAMPED_MODE_ENABLE)	; No - set max parameter values
paraval_end_a:	
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #3				; Function 3?
	jnz	paraval_end_b			; No - branch
	mov	Temp1, #2				; Yes - set max parameter values
	ajmp	paraval_end_c
paraval_end_b:
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #8				; Function 8?
	jnz	paraval_end_c			; No - branch
	mov	Temp1, #13			; Yes - set max parameter values
	ajmp	paraval_end_d
paraval_end_c:
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #11				; Function below 11?
	jc 	paraval_end_d			; Yes - branch
	mov	Temp1, #2				; No - set max parameter values
paraval_end_d:
ENDIF
	inc	Temp1
	clr	C
	mov	A, Tx_Pgm_Paraval_No		
	subb	A, Temp1				
	jnc 	function_next			; Last parameter value?
	jmp	beep_no_entry			; No - go back

function_next:					; Yes - Next function value
	call wait1s
	call wait1s
	inc	Tx_Pgm_Func_No			; Function value no
IF MODE == 0
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #17				; Main has 16 functions	
ENDIF
IF MODE >= 1
	clr	C
	mov	A, Tx_Pgm_Func_No		
	subb	A, #14				; Tail and multi has 13 functions	
ENDIF
	jnc 	program_by_tx_exit		; Last function value?
	jmp	paraval_no_entry		; No - go back

program_by_tx_exit:
	clr	EA					; Disable all interrupts
	mov 	RSTSRC, #00h   		; Clear VDD monitor as a reset source (PORSF)                                
	orl	RSTSRC, #10h			; Generate hardware reset
	call wait1s
