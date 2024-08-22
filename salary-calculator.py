import sys

# Check if the correct number of arguments are provided
if len(sys.argv) != 3:
    print("Usage: python salary-calculator.py <hours_worked> <hourly_rate>")
    sys.exit(1)

# Parse the command-line arguments
numb_hours = float(sys.argv[1])
hourly_rate = float(sys.argv[2])

# Calculate and print the earnings
print('Last month, you earned:', float(numb_hours * hourly_rate), 'dollars')
