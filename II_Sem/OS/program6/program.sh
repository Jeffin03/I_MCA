#!/bin/bash
# Script to convert CSV to TSV and measure execution time
start=$(date +%s)

echo "Enter the CSV file name:"
read input_file
output_file="${input_file%.csv}.tsv"

sed 's/,/\t/g' "$input_file" > "$output_file"
end=$(date +%s)
echo "CSV to TSV conversion completed"
echo "Output file: $output_file"
echo "Time taken: $((end - start)) seconds"
