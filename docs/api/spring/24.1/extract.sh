#!/bin/bash

#extract java doc jar
currentVersion="24.1.8"


find . -name "*.jar" | while read jarFileName
do
    
    directoryName=$(echo "${jarFileName}" | sed -r "s/-${currentVersion}-javadoc.jar//g")
    mkdir "${directoryName}"
    
    cp "${jarFileName}" "${directoryName}"
    cd "${directoryName}"

    jar xvf "${jarFileName}"
    rm -f "${jarFileName}"

    cd ..

done