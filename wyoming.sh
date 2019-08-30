echo "Entre com o dia(DD):"
read diaini
#echo "Entre com o dia final(DD):"
#read diafin
echo "Entre com o mes(MM):"
read mes
echo "Entre com o ano inicial(AAAA):"
read anoini
echo "Entre com o ano final(AAAA):"
read anofin
echo "Entre com a estacao(NNNNN):"
read estacao

declare -i dia=$[diaini]
declare -i mes=$[mes]
declare -i ano=$[anoini]
declare -i estacao=$[estacao]
declare -i anoin=$[anoini]
declare -i anofi=$[anofin]

#until test $[anoin] -eq $[anofi] ; do

while [ $anoin -le 2020 ] 
do

mes=mes
while [ $mes -le 12 ]
do

	dia=diaini
	while [ $dia -le 31 ]	
	do

	if test $[dia] -le 9 && test $[mes] -le 9
	then

	wget "http://weather.uwyo.edu/cgi-bin/sounding?region=naconf&TYPE=TEXT%3ALIST&YEAR="$[ano]"&MONTH="$[mes]"&FROM="$[dia]"12&TO="$[dia]"12&STNM="$[estacao]"" -O ${ano}0${mes}0${dia}_12.txt
	fi

	if test $[dia] -le 9 && test $[mes] -ge 10 && test $[mes] -le 12
	then

	wget "http://weather.uwyo.edu/cgi-bin/sounding?region=naconf&TYPE=TEXT%3ALIST&YEAR="$[ano]"&MONTH="$[mes]"&FROM="$[dia]"12&TO="$[dia]"12&STNM="$[estacao]"" -O ${ano}${mes}0${dia}_12.txt
	fi

	if test $[dia] -ge 10 && test $[dia] -le 31 && test $[mes] -le 9 
	then

	wget "http://weather.uwyo.edu/cgi-bin/sounding?region=naconf&TYPE=TEXT%3ALIST&YEAR="$[ano]"&MONTH="$[mes]"&FROM="$[dia]"12&TO="$[dia]"12&STNM="$[estacao]"" -O ${ano}0${mes}${dia}_12.txt
	fi

	if test $[dia] -ge 10 && test $[dia] -le 31 && test $[mes] -ge 10 && test $[mes] -le 12
	then

	wget "http://weather.uwyo.edu/cgi-bin/sounding?region=naconf&TYPE=TEXT%3ALIST&YEAR="$[ano]"&MONTH="$[mes]"&FROM="$[dia]"12&TO="$[dia]"12&STNM="$[estacao]"" -O ${ano}${mes}${dia}_12.txt
	fi

	dia=dia+1
	done

	diaini=00
	mes=mes+1
	done

anoin=anoin+1

done
