for VAR1 in java python go .net
do
    echo "Looping..."
    echo "Value of VAR1 is $VAR1"
done
MYUSERS="alpha beta gamma"


for usr in $MYUSERS
do
    useradd $usr
    id $usr
done

for i in {0..10..2}
do
    echo "Welcome $i times"
done

#############    WHILE LOOP    ##########

count=0
while [ $count -lt 5 ]
do 
    echo "LOOPING..."
    echo "Value of counter is $count"
    count=$((count+1))
done
echo "AND we are out of the loop"