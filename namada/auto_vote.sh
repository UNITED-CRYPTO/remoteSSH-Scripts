for VAR in 621 622 641 642
#for (( VAR=631; VAR <= 643; VAR++ ))
do
 echo $VAR
 ./auto_vote.sh $VAR
done
