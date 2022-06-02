#command -v node >/dev/null
#if $? == 0 then
#    echo "success"
#fi
abc="abliablibaba is a great company"
echo ${#abc}
i=${abc:1:2}
echo ${#i}
array_name=(1 2 4 n)
echo ${array_name[1]}
echo ${array_name[@]}
echo ${array_name[*]}
echo ${abc#'abli'}
echo ${abc##'abli'}

