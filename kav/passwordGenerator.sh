x=1
echo "" > passwords.txt
while [ $x -le 99 ]
do
	if [ $x -eq 1 ]
		then
			str="$(perl randompasswords)"
	fi
	str="$str $(perl randompasswords)"
        x=$(($x+1))
done
echo "$str" >> passwords.txt
