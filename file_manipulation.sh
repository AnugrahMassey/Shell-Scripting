#!/bin/bash

# File Manipulation Script using sed & awk

# Define the file
FILE="sample.txt"

# Create a sample file if it doesn't exist
if [ ! -f "$FILE" ]; then
    echo -e "ID,Name,Age\n1,John,25\n2,Alice,30\n3,Bob,28" > "$FILE"
    echo "✅ Sample file 'sample.txt' created."
fi

echo "📂 Processing file: $FILE"

# Using 'sed' to replace 'Alice' with 'Eve'
echo "🔄 Replacing 'Alice' with 'Eve'..."
sed -i 's/Alice/Eve/g' "$FILE"

# Using 'awk' to extract names from the CSV file
echo "📊 Extracting names from file using awk:"
awk -F',' 'NR>1 {print "Name:", $2}' "$FILE"

# Append new data using 'sed'
echo "➕ Appending a new line using sed..."
sed -i '$a 4,Charlie,35' "$FILE"

# Display final file content
echo "📄 Final File Content:"
cat "$FILE"

echo "✅ File manipulation completed!"
