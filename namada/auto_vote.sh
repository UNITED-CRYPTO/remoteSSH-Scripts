#for VAR in 621 622 641 642
for (( VAR=646; VAR <= 648; VAR++ ))
do
 echo $VAR
 ./auto_vote.sh $VAR
done
