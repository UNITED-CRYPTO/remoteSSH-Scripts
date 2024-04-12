#for VAR in 621 622 641 642 648
for (( VAR=701; VAR <= 708; VAR++ ))
do
 echo $VAR
 ./auto_vote.sh $VAR
done
