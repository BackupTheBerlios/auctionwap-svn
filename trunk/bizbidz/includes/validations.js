function testEMPTYUSER(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
		validatePrompt (Ctrl, "Please enter Username");
		return (false); 
	} else 
		return (true); 
} 
function testEMPTYPWD(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
		validatePrompt (Ctrl, "Please enter Password") ;
		return (false); 
	} else 
		return (true); 
} 
function testEMPTYCPWD(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
		validatePrompt (Ctrl, "Please enter confirm Password") ;
		return (false); 
	} else 
		return (true); 
} 

function testEMPTY(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
//		validatePrompt (Ctrl, "Name should not be Empty") ;
		return (false); 
	} else 
		return (true); 
} 
function testEMPTYSTREET(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
		validatePrompt (Ctrl, "Street Name should not be Empty") ;
		return (false); 
	} else 
		return (true); 
}
function testEMPTYADDRESS(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
		validatePrompt (Ctrl, "Please fill the Address") ;
		return (false); 
	} else 
		return (true); 
}
function testEMPTYCITY(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
		validatePrompt (Ctrl, "City Name should not be Empty") ;
		return (false); 
	} else 
		return (true); 
}
function testEMPTYSTATE(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
		validatePrompt (Ctrl, "State Name should not be Empty") ;
		return (false); 
	} else 
		return (true); 
}
function testEMPTYCOUNTRY(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
		validatePrompt (Ctrl, "Country Name should not be Empty"); 
		return (false); 
	} else 
		return (true); 
}


function testEMPTYIC(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
		validatePrompt (Ctrl, "IC No should not be Empty") ;
		return (false); 
	} else 
		return (true); 
}
function testEMPTYDOB(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
		validatePrompt (Ctrl, "Enter Staff DOB") ;
		return (false); 
	} else 
		return (true); 
}
function testEMPTYFIELD(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value == 0) { 
		validatePrompt (Ctrl, "Field should not be Empty") ;
		return (false); 
	} else 
		return (true); 
}
function testNUMBER(form1, Ctrl) { 
	if (Ctrl.value == "" || isNaN (Ctrl.value) == 1) { 
		validatePrompt (Ctrl, "Enter a valid Number") ;
		return (false); 
	} else 
		return (true); 
}
function testNUMBERPIN(form1, Ctrl) { 
	if (Ctrl.value == "" || isNaN (Ctrl.value) == 1 || Ctrl.length < 5 || Ctrl.length > 5) { 
		validatePrompt (Ctrl, "Enter a valid Pos Kode Number") ;
		return (false); 
	} else 
		return (true); 
}
function testMAIL(form1, Ctrl) { 
	if (Ctrl.value == "" || Ctrl.value.indexOf ('@', 0) == -1) { 
		validatePrompt (Ctrl, "Enter a valid email address") ;
		return (false); 
	} else 
		return (true); 
}

function validatePrompt (Ctrl, PromptStr) { 
	alert (PromptStr) ;
	Ctrl.focus(); 
	return; 
}

function isEmailValid ( str1 )
{
	if ( str1 == null )
		return false;
		
	var str = new String ( str1 );
		
	if ( str.indexOf ( "@" ) == -1 || str.indexOf ( "." ) == -1 )
	{
		return false;
	}
	
	// For checking more than one '@' Symbol
	
	var tmp = str.substring ( str.indexOf ( "@" ) + 1 );
	
	if ( tmp.indexOf ( "@" ) != -1 )
	{
		return false;
	}

	// For checking minimum two characters after " ." 
	
	tmp = str.substring ( str.lastIndexOf ( "." ) );

	if ( tmp.length < 3 )
	{
		return false;
	}
	
	return true;
} 
function isCEmailValid ( str1 )
{
	if ( str1 == null )
		return false;
		
	var str = new String ( str1 );
		
	
	if ( str.indexOf ( "@" ) == -1 || str.indexOf ( "." ) == -1 )
	{
		return false;
	}
	
	// For checking more than one '@' Symbol
	
	var tmp = str.substring ( str.indexOf ( "@" ) + 1 );
	
	if ( tmp.indexOf ( "@" ) != -1 )
	{
		return false;
	}

	// For checking minimum two characters after " ." 
	
	tmp = str.substring ( str.lastIndexOf ( "." ) );

	if ( tmp.length < 3 )
	{
		return false;
	}
	
	return true;
} 

function isDate ( day, month, year )
{
	if( ! ( isPosInteger ( day ) && isPosInteger ( month ) && isPosInteger ( year ) ) )
	{
		return false;
	}
	
	if ( new String ( year ).length <= 3 )
		return false;
	
	day = parseInt ( day, 10 );
	year = parseInt ( year, 10 );
	
	if ( ( day <= 0 && day > 31 ) || year <= 1800 )
		return false;
		

	switch ( parseInt ( month, 10 ) )
	{
		case 1	:
							if ( !( (day > 0) && (day <= 31) ) )
								return false;
							break;								
		case 2	:   
							if ( ( year % 4 == 0 ) && ( year % 100 != 0 ) || ( year % 400 == 0 ) )
							{
								if ( !( day > 0 && day <= 29 ) )
									return false;
							}
							else
								if ( !( day > 0 && day <= 28 ) )
									return false;
							break;									
		case 3	:	    
							if ( !( day > 0 && day <= 31 ) )
								return false;							
							break;								
		case 4	:
							if ( !( day > 0 && day <= 30 ) )
								return false;
							break;
		case 5	:    
							if ( !( day > 0 && day <= 31 ) )
								return false;
							break;	
		case 6	:    
							if ( !( day > 0 && day <= 30 ) )
								return false;
							break;								
		case 7	: 
							if ( !( day > 0 && day <= 31 ) )
								return false;
							break;								
		case 8	:	
							if ( !( day > 0 && day <= 31 ) )
								return false;
							break;								
		case 9	:
							if ( !( day > 0 && day <= 30 ) )
								return false;
							break;	
		case 10	: 
							if ( !( day > 0 && day <= 31 ) )
								return false;
							break;	
		case 11	: 
							if ( !( day > 0 && day <= 30 ) )
								return false;
							break;	
		case 12	:
							if ( !( day > 0 && day <= 31 ) )
								return false;
							break;			
		default	:
							return false;
	}
	
	return true;
}				