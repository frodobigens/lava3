#!/bin/bash

RPC_URL="https://rpc.starknet.lava.build/lava-referer-9b03ef7c-4d41-4d61-b5fe-3bde6b79bd7e/"

OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

starknet_data=$(curl -A UA -x http://104.238.9.151:6604 --proxy-user cwmgurpo:3lv7ii9r7e6p -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"starknet_blockNumber"}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$starknet_data" >> "$OUTPUT_DIR/starknet.txt"
    
    echo "StarkNet data fetched and saved to $OUTPUT_DIR/starknet.txt."
else
    echo "Failed to fetch StarkNet data."
fi
