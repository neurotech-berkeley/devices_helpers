import pandas as pd
import argparse

def transform_to_cpl_format(csv_filepath, output_filepath):
    # Load data from the CSV file
    csv_data = pd.read_csv(csv_filepath)
    
    # Convert negative rotation angles to positive by taking modulo 360
    csv_data['Rot'] = csv_data['Rot'].apply(lambda x: 360 + x if x < 0 else x)
    
    # Convert PosX and PosY to strings with "mm" appended, matching the CPL format
    # csv_data['Mid X'] = csv_data['PosX'].apply(lambda x: f"{x:.4f}mm")
    # csv_data['Mid Y'] = csv_data['PosY'].apply(lambda x: f"{x:.4f}mm")
    csv_data['Mid X'] = csv_data['PosX'].apply(lambda x: f"{x}")
    csv_data['Mid Y'] = csv_data['PosY'].apply(lambda x: f"{x}")
    
    # Map Side to Layer (assuming 'top' -> 'Top' and 'bottom' -> 'Bottom')
    # csv_data['Layer'] = csv_data['Side'].map({'top': 'Top', 'bottom': 'Bottom'})
    csv_data['Layer'] = csv_data['Side'] # may not require reconfiguration
    
    # Rename columns to match CPL format
    csv_data.rename(columns={
        'Ref': 'Designator',
        'Rot': 'Rotation'
    }, inplace=True)
    
    # Select and order columns to match the CPL format
    transformed_data = csv_data[['Designator', 'Mid X', 'Mid Y', 'Layer', 'Rotation']]
    
    # Save the transformed data to a new CSV file
    transformed_data.to_csv(output_filepath, index=False)
    print(f"Transformed CPL data saved to {output_filepath}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Transform CSV data to CPL format.")
    parser.add_argument("input_file", help="Path to the input CSV file")
    parser.add_argument("output_file", help="Path to the output CSV file")
    
    args = parser.parse_args()
    
    transform_to_cpl_format(args.input_file, args.output_file)
