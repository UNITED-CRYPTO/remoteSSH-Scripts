#for VAR in 621 622 641 642
for (( VAR=644; VAR <= 648; VAR++ ))
do
 echo $VAR
 ./auto_vote.sh $VAR
done
