#!/bin/sh

#  generate_vtexAPI.sh
#  WBSeniorCourse
#
#  Created by Vitaly Malkov on 18.08.2024.
#  

MODULE="Module/VtexAPI/Sources/VtexAPI/"

openapi-generator generate -i "vtex.yaml" -g swift5 -o "vtex"
rm -r $MODULE""*
cp -R "vtex/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "vtex"
