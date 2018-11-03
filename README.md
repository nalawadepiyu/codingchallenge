# codingchallenge
### Files 
- file.tmp : temporary file to write string in it.
- code.sh : Code for a program that will iterate over the input, adding the digits, and returning the result.

code :

- To read string from file, iterate it and calculate sum :
```
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
```
- To iterate and calculate sum

```
if $flag; then 
	tot=0
      for (( i=0; i<${#foo}; i++ )); do
        if [ -z `echo ${foo:$i:1} | tr -d "[:digit:]"` ]; then
            let tot+=${foo:$i:1}
        fi
        done  
        echo "$tot"    
fi
```

#### Test Cases

```
$ echo "abc123" | ./code.sh
6
$ echo "abc123" | ./ code.sh -x
39
$ echo "qq" | ./ code.sh
0
$ echo "abc123" > file.tmp
$ echo "abc123" > file.tmp | ./code.sh -f file.tmp
6
```
