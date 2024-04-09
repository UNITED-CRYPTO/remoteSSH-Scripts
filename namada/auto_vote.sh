# for VAR in 621 622 624
for (( VAR=624; VAR <= 630; VAR++ ))
do
 echo $VAR
 ./auto_vote.sh $VAR
done
