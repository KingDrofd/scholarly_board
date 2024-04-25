import pandas as pd
import csv
import json
excel_file = "assets/files/StudentsPerformance.xlsx"
converted_csv = "assets/files/StudentsPerformance.csv"


# excel_file = pd.read_excel(excel_file)
# excel_file.to_csv(converted_csv, index=False)


# def format_value(value):
#     if isinstance(value, str):
#         return f'"{value}"'
#     else:
#         return value

# def format_csv(input_file, output_file):
#     df = pd.read_csv(input_file)
#     df.to_csv(output_file, index=False, quoting=csv.QUOTE_NONNUMERIC, header=False)

# def format_json(input_file, output_file):
#     df = pd.read_csv(input_file)
#     df.to_json(output_file, index=False, orient='records')


# def headers_to_json(input_file, output_file):
#     df = pd.read_csv(input_file)
#     headers =df.columns.to_list()
#     with open(output_file, 'w') as json_file:
#         json.dump(headers, json_file)


# input_file = converted_csv
# output_file = 'assets/files/FormattedStudentsPerformance.csv'
# json_headers_output_file ='assets/files/DataHeaders.json'
# json_output_file = 'assets/files/StudentsPerformance.json'
# format_csv(input_file, output_file)

# format_json(input_file, json_output_file)



# headers_to_json(converted_csv, json_headers_output_file)
