import pandas as pd

# this is specifically to extract the IDs from the excel sheet

# Read the Excel file
df = pd.read_excel(r"C:\Users\Dell\Downloads\DEDUCTIONS - I SEM 2023-24 (1).xlsx")

# Assuming the IDs are in a column named 'Campus ID'
ids = df['Campus ID'].tolist()
import pandas as pd

# Read the Excel file
df = pd.read_excel(r"C:\Users\Dell\Downloads\DEDUCTIONS - I SEM 2023-24 (1).xlsx")

# Print the column names
print(df.columns)

# Assuming the IDs are in a column named 'Campus ID'
ids = df['Campus ID'].tolist()

# Print the IDs
for id in ids:
     print(f"'{id}',")

# Print the IDs
for id in ids:
    print(f"'{id}',")