# for VAR in 621 622 624
for (( VAR=621; VAR <= 623; VAR++ ))
do
 echo $VAR
 ./auto_vote.sh $VAR
done
