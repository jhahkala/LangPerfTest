#!/bin/bash

if [ "juttu" == "juttu$1" ]
then
	echo "Usage: dotest.sh <host name>"
	exit 0
fi

hostname=${1-"nameless"}

tests=( io binary regex spectra thread )
iterations=5
id=$(date +%s)
pwd=$(pwd)
preparationLog=$pwd"/preparation_"$id".log"

mkdir results

function prepare()
{
	for test in ${tests[@]}
	do
		if [ "$test" == "io" ]
			then
			cd $pwd"/io"
			echo $(date)" - Generating test files. Will take some minutes"
			#./genfiles.sh &> /dev/null
			cd $pwd
			echo "files ready"
		fi
		echo $(date) - Preparing test $test >> $preparationLog
		languages=$( ls -d $test/*/ )
		for language in ${languages[@]}
		do
			echo "Preparing language $language for $test test"
			testPath=$language
			echo $testPath
			cd $testPath
			chmod u+x -R *
			./run.sh &>> $preparationLog
			chmod u+x -R *
			cd $pwd
		done
	done
}

function doTests()
{
	for test in ${tests[@]}
	do
		languages=$( ls -d $test/*/ )
		for language in ${languages[@]}
		do
			echo $(date)" - Doing test $test with $language"
			languageStr=$( basename $language )
			output=$pwd"/results/"$hostname"_"$test"_"$languageStr"_"$id
			touch $output
			testPath=$language
			cd $pwd"/"$testPath
			echo "Path: $(pwd), output: $output"
			/usr/bin/time -a -o "$output" -f "%E;%U;%S;%M;%t;%R" ./runTest.sh &> /dev/null
			cd $pwd
		done
	done
}
function doTestsNocache()
{
	for test in ${tests[@]}
	do
		languages=$( ls -d $test/*/ )
		for language in ${languages[@]}
		do
			echo $(date)" - Doing test $test with $language"
			languageStr=$( basename $language )
			output=$pwd"/results/"$hostname"_"$test"_"$languageStr"_noCache_"$id
			touch $output
			testPath=$language
			cd $pwd"/"$testPath
			echo "Path: $(pwd), output: $output"
			/usr/bin/time -a -o "$output" -f "%E;%U;%S;%M;%t;%R" ./runTest.sh &> /dev/null
			cd $pwd
			./dropCaches.sh
		done
	done
}

prepare

for iteration in `seq 1 $iterations`
do
	doTests
done

for iteration in `seq 1 $iterations`
do
	doTestsNocache
done
