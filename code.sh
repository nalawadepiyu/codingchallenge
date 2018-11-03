#!/bin/bash
read foo
flag=true
while getopts 'xf' OPTION; do
  case "$OPTION" in
    x)
      sum=0
	unset flag
	flag=false
      for (( i=0; i<${#foo}; i++ )); do
         let sum+=$((16#${foo:$i:1}))
        done
        echo "$sum"
      ;;
f)
	unset flag
	flag=false
     file='file.tmp'
	while read line; do
	for (( i=0; i<${#line}; i++ )); do
  		if [ -z `echo ${line:$i:1} | tr -d "[:digit:]"` ]; then
   			let tot+=${line:$i:1}
		fi
	done	
	done < $file
	echo "$tot"
	;;   
    ?)
      echo "script usage: $(basename $0) [-x] [-h] " >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"
if $flag; then
	tot=0
      for (( i=0; i<${#foo}; i++ )); do
        if [ -z `echo ${foo:$i:1} | tr -d "[:digit:]"` ]; then
            let tot+=${foo:$i:1}
        fi
        done  
        echo "$tot"    
fi