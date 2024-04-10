#for VAR in 621 622 641 642 648
for (( VAR=650; VAR <= 666; VAR++ ))
do
 echo $VAR
 ./auto_vote.sh $VAR
done
