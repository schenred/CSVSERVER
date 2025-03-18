#!/bin/bash

# Start index, end index from arguments
START=${1:-0}
END=${2:-9}

# Ensure valid numeric input
if ! [[ "$START" =~ ^[0-9]+$ ]] || ! [[ "$END" =~ ^[0-9]+$ ]] || [ "$START" -ge "$END" ]; then
    echo "❌ Error: Provide valid numbers with START < END!"
    exit 1
fi

# Generate input file
echo "📄 Generating inputFile with rows from $START to $END..."
> inputFile

for (( i=START; i<=END; i++ )); do
    echo "$i,$((RANDOM % 1000))" >> inputFile
done

echo "✅ inputFile generated with $((END - START + 1)) rows!"

