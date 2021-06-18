import pandas as pd
import sys

def convert(filename):
    try:
        file_prefix = filename.split('.')[0]
        # print('File Prefix: {}'.format(file_prefix))
        csv_filename = '{}.csv'.format(file_prefix)
        df = pd.read_csv(filename, sep='\t', low_memory=False)
        df.to_csv(csv_filename, index=False, date_format='%y')
    except Exception as e:
        print(e)

    message = 'File {} converted to CSV: {}'.format(filename, csv_filename)
    return message

if __name__ == '__main__':
    try:
        filename = sys.argv[1]
        test = convert(filename)
        print(test)
    except:
        print('No filename provided')
