#!/bin/bash

is_prime() {
    local number=$1
    for (( i=2; i*i<=number; i++ )); do
        if (( number % i == 0 )); then
            return 1
        fi
    done
    return 0
}

sum_of_primes() {
    local limit=$1
    local sum=0
    local number=2

    while (( number <= limit )); do
        if is_prime $number; then
            sum=$((sum + number))
        fi
        ((number++))
    done

    echo $sum
}

echo $(sum_of_primes $1)
