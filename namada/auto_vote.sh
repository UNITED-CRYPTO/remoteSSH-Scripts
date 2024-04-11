#for VAR in 621 622 641 642 648
for (( VAR=681; VAR <= 686; VAR++ ))
do
 echo $VAR
 ./auto_vote.sh $VAR
done
