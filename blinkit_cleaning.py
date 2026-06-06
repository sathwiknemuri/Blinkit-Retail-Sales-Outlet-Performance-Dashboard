import pandas as pd

# Load CSV
df = pd.read_csv("BLINKIT.csv")

# =========================
# 1. Remove Duplicate Rows
# =========================
df.drop_duplicates(inplace=True)

# =========================
# 2. Handle Missing Values
# =========================

# Fill Item_Weight with median
df['Item_Weight'] = df['Item_Weight'].fillna(df['Item_Weight'].median())

# Fill Outlet_Size with mode
df['Outlet_Size'] = df['Outlet_Size'].fillna(df['Outlet_Size'].mode()[0])

# =========================
# 3. Standardize Categories
# =========================

df['Item_Fat_Content'] = df['Item_Fat_Content'].replace({
    'LF': 'Low Fat',
    'low fat': 'Low Fat',
    'reg': 'Regular'
})

# =========================
# 4. Fix Visibility Values
# =========================

# Replace 0 visibility with median visibility
median_visibility = df[df['Item_Visibility'] > 0]['Item_Visibility'].median()
df['Item_Visibility'] = df['Item_Visibility'].replace(0, median_visibility)

# =========================
# 5. Remove Leading/Trailing Spaces
# =========================

for col in df.select_dtypes(include='object').columns:
    df[col] = df[col].str.strip()

# =========================
# 6. Save Cleaned File
# =========================

df.to_csv("BLINKIT_CLEANED.csv", index=False)

# =========================
# 7. Validation Report
# =========================

print("Shape:", df.shape)
print("\nMissing Values:")
print(df.isnull().sum())

print("\nDuplicates:", df.duplicated().sum())

print("\nData Types:")
print(df.dtypes)

print("\nCleaned file saved as BLINKIT_CLEANED.csv")