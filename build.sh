#!/bin/bash

# Reference:
os_archs=(
    # windows/amd64
    linux/amd64
    drawin/amd64
    # freebsd/amd64
    openbsd/amd64
    netbsd/amd64
    dragonfly/amd64
    solaris/amd64
)

releases=()
fails=()

for os_arch in "${os_archs[@]}"
do
    v_os=${os_arch%/*}
    v_arch=${os_arch#*/}

    os_str="${v_os}"
    arch_str=""

    filename=cross-env

    if [[ ${v_os} == "windows" ]];
    then
        filename+=.exe
    elif [[ ${v_os} == "drawin" ]];then
        os_str="macos"
    fi


    if [[ ${v_arch} == "amd64" ]];then
        arch_str="-m64"
    elif [[ ${v_arch} == "386" ]];then
        arch_str="-m32"
    else
        arch_str="-m64"
    fi

    echo "Building ${os_arch}"

    v -show-c-output -prod -cg -os ${os_str} ${arch_str} -o ./bin/${filename} main.v

    # if build success
    if [[ $? == 0 ]];then
        releases+=(${os_arch})
        cd ./bin

        tar -czf cross-env_${v_os}_${v_arch}.tar.gz ${filename}

        if [[ $? != 0 ]];then
            fails+=(${os_arch})
        fi
        rm -rf ./${filename}

        cd ../
    else
        fails+=(${os_arch})
    fi
done

echo

if [[ -n "$fails" ]]; then
    echo "fails:"

    for os_arch in "${fails[@]}"
    do
        printf "\t%s\n" "${os_arch}"
    done

    exit 1
fi


if [[ -n "releases" ]]; then
    echo "release:"

    for os_arch in "${releases[@]}"
    do
        printf "\t%s\n" "${os_arch}"
    done
else
    echo "there's no build success"
    exit 1
fi

echo