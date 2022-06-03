@echo off
@setlocal enableexensions enabledelayedexpansion
	title Net Config Tool
	color 0a

:a
cls
		
		echo	####    NETWORK CONFIGURATION TOOL
		echo	####
		echo	####				  
		echo	####    1. IP DIRECTORY	  	  
		echo	####    2. PING AN ADDRESS        
		echo	####    3. SET IPV4 CONFIGURATION 
		echo	####    4. CLEAR IP DATABASE	  
		echo	####				  

			set choice=
				set /p choice=#### Selection: 
		if not '%choice%'=='' set choice=%choice:~0%
			if '%choice%'=='1' goto :b
				if '%choice%'=='2' goto :c
					if '%choice%'=='0' goto :a
						if '%choice%'=='3' goto :d
							if '%choice%'=='4' goto :e
							
	ECHO "%choice%" is not valid, try again

:b
	cls
	arp -a
		echo #### Press any button to return to mainpage..
	pause>nul
			goto :a

:c
cls
echo =============================================================
echo ====            Enter IP address to ping..               ====
echo =============================================================

set /p adress=IP address:

ping %adress% & echo. & pause. 
		echo.
	echo ### Press enter to return to menu..
		pause>nul
			goto :a

:d
	cls
	echo #######################################################################
	echo #### 	           NETWORK CONFIGURATION TOOL			   ####
	echo #######################################################################
	echo ####	PLEASE ENTER THE IP ADDRESS YOU WOULD LIKE TO SET	   ####
	echo #######################################################################
		set UserInput=
		set /p UserInput=
			if '%UserInput%'=='%UserInput%' netsh interface ipv4 set address Ethernet static %UserInput%
	
	echo #######################################################################
	echo ####		IP ADDRESS SUCCESSFULLY CHANGED			   ####
	echo #######################################################################
	
	

	echo #### Press any button to return to mainpage..
	pause>nul
	goto :a
:e
	cls
	netsh interface ip delete arpcache
		echo #### IP database cleared..
		echo #### Resolving MAC Addresses for IP addresses..
		echo #### Allow one minute for IP addresses to autopopulate..
		echo #### Press any button to return to mainpage..
	pause>nul
			goto :a

