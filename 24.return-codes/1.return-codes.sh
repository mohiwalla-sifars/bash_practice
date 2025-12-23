#!/usr/bin/env bash

success(){
    echo "success"
    return 0
}

fail(){
    echo "fail"
    return 1
}

max_error_code(){
    echo "larger than 255 is not allowed"
    return 256
}
printrespose(){
    echo "message $1 code $2"
}


success_response=$(success)
success_code=$?
printrespose "$success_response" "$success_code"

error_response=$(fail)
error_code=$?
printrespose "$error_response" "$error_code"

m_error_response=$(max_error_code)
m_error_code=$?
printrespose "$m_error_response" "$m_error_code"

