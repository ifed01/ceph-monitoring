#!/bin/bash

#$1 - osd list
#$2 - completion pattern
osd=$1
c_pattern=$2

function wait_more() {
   startT=$1
   endT=$(date +%s)
   echo $endT $startT
   duration=$(expr $endT - $startT)
   echo "waiting stat and load modules to complete"
   while [[ $duration -le $2 ]]; do
     sleep 1
     endT=$(date +%s)
     duration=$(expr $endT - $startT)
   done
   echo "proceeding"
}

./reset.sh "$1"
testN=0

#######################################################
testN=$(expr $testN + 1 )

B=5
R=8
N=8
W=0.25
printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W
./setup.sh $R $B >/dev/nul 2>/dev/nul

printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W >>net.log
./ceph_info2.sh 750 >>net.log &
sleep 5
printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W >>fio.log 
sudo /usr/local/bin/fio 111.cfg >>fio.log &

./in.sh "$osd" "$c_pattern" $N $W $W 1
wait_more $startT 770
./reset.sh "$1" >/dev/nul 2>/dev/nul


#######################################################
testN=$(expr $testN + 1 )

B=2
R=3
N=20
W=1
printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W
./setup.sh $R $B >/dev/nul 2>/dev/nul

printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W >>net.log
./ceph_info2.sh 750 >>net.log &
sleep 5
printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W >>fio.log 
sudo /usr/local/bin/fio 111.cfg >>fio.log &

./in.sh "$osd" "$c_pattern" $N $W $W 1
wait_more $startT 770
./reset.sh "$1" >/dev/nul 2>/dev/nul


#######################################################
testN=$(expr $testN + 1 )

B=3
R=5
N=20
W=1
printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W
./setup.sh $R $B >/dev/nul 2>/dev/nul

printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W >>net.log
./ceph_info2.sh 750 >>net.log &
sleep 5
printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W >>fio.log 
sudo /usr/local/bin/fio 111.cfg >>fio.log &

./in.sh "$osd" "$c_pattern" $N $W $W 1
wait_more $startT 770
./reset.sh "$1" >/dev/nul 2>/dev/nul



#######################################################
testN=$(expr $testN + 1 )

B=3
R=5
N=20
W=1
printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W
./setup.sh $R $B >/dev/nul 2>/dev/nul

printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W >>net.log
./ceph_info2.sh 750 >>net.log &
sleep 5
printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W >>fio.log 
sudo /usr/local/bin/fio 111.cfg >>fio.log &

./in.sh "$osd" "$c_pattern" $N $W $W 1
wait_more $startT 770
./reset.sh "$1" >/dev/nul 2>/dev/nul



#######################################################
testN=$(expr $testN + 1 )

B=3
R=5
N=10
W=1
printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W
./setup.sh $R $B >/dev/nul 2>/dev/nul

printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W >>net.log
./ceph_info2.sh 750 >>net.log &
sleep 5
printf ">>>>>>> Test %d (%d %d %d %f)" $testN $B $R $N $W >>fio.log 
sudo /usr/local/bin/fio 111.cfg >>fio.log &

./in.sh "$osd" "$c_pattern" $N $W $W 1
wait_more $startT 770
./reset.sh "$1" >/dev/nul 2>/dev/nul

