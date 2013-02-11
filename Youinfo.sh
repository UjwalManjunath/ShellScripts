#! /bin/sh
me=`whoami`
if test $# -eq 0
then
	sh $0 $me	
else
	echo "User: $me"
	id $1 >>/dev/null
	if [ $? -ne 0 ]     
	then 
		exit 1
	else
		echo ">>>Target: $1\n "
		echo `ypcat passwd | grep $1 | awk -F: '{print "Full Name:" $5}'|head -1`	 
		echo "Main Group Name:"`id -gn $1`
		cnt=`id -Gn $1| awk '{ print NF }'`
			if test $cnt -ge 2
			then
				echo "Other Group Names:" `id -Gn $1 | cut -d " " -f2-`  
			else
				echo "other Group Names: NONE"
       		 	fi
		echo "\n\n>>> Current Host: `hostname`\c"
		echo " --> Address: `ifconfig -a | grep -w inet | grep -v 127.0.0.1 | tail -1 | 
awk '{print $2}' | cut -d ":" -f2
`"
		echo "Operating System: `uname`\n"
		tot=`last | grep -c $1`
		echo ">>> Total Logins: $tot"
			if test $tot -gt 0
			then
				mst=`last -a $1 | grep $1 | awk '{print $NF}' | uniq -c | sort -r | head -1`
				mstnum=`echo $mst| awk '{print $1}'`
				mcname=`echo $mst | awk '{print $2}'`
				echo "Most($mstnum) From $mcname\c"
				echo "`echo $mcname | nslookup | grep "Address" |tail -1 ` "
			fi
	 
			#if [ -f LOGFILE ]
			#then
				#echo `more LOGFILE`>> /dev/null
			#else
				#echo "Date     	   USER      TARGET    HOST     FROM ">>LOGFILE
			#fi
		#echo "`date '+%Y-%m-%d %R'`   \c" >> LOGFILE
       		#echo "$me  \c" >> LOGFILE
	       # echo "$1  \c" >> LOGFILE
       		#echo "`hostname`  \c" >> LOGFILE
        	#echo `who -m | awk '{print $NF}'` >> LOGFILE
	fi
fi	




