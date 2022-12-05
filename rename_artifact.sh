#!/bin/bash

#rm -rf simple-app.war
#mv simple-app-*.war simple-app.war
#scp -r simple-app.war root@172.31.38.189:/opt/

#cd artifact
#if (( $? == 0)); then  rm -rf *.war; fi

for f in [a-z]*.war; do
base=${f%.*}	

    mv  "$f" "${base//[^a-z]}.${f##*.}"
done

scp -r *.war root@172.31.38.189:/opt/

if (( $? == 0)); then  rm -rf *.war; fi
