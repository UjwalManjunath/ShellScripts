Name : Ujwal Manjunath



NAME

YouInfo  -    Display login information about current or another target user
 
SYNOPSIS

loginfo   [target user]

DESCRIPTION

This script generates the following information:
1.     Target user login information:
·        Full name
·        Main group membership name
·        Other group memberships names if any other than the main group.
 
If the [target user]   login argument is missing the current user login is used.
 
2.     Current host information:
·        Host name and IP address
·        Operating System.
 
3.     Login Statistics on the current host:
·        Total number of logins.
·        The Name and IP address of the host where the user mostly used to login.
 
4.     LOGFILE  that contains the following information of each successful invocation of the script:
·        Date of usage in the form: year-month-day hour:minute
·        User login
·        Target login
·        Login host name
·        Host name from which the user used to login.

