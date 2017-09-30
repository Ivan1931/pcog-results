import csv
import sys
import re

files = sys.argv[1:]

total_kills = 0
succesful_attacks = 0
total_time_elapsed = 0
epoch_count = 0
success = 0

def get_time(time_string):
    return int(time_string)


print('iteration,surival_time,kills,succesful_attacks,total_attacks,score,did_win')
count = 0
for csv_file in files:
    with open(csv_file) as cf:
        cf.readline()
        reader = csv.DictReader(cf)
        try:
            if 60 <= count:
                break
            previous_time = 0
            for row in reader:
                count += 1
                iteration_numbers = int(row['Iteration'])
                current_time = get_time(row['Survival_Time'])
                time_elsapsed = current_time - previous_time
                previous_time = current_time
                kills = int(row['Predators_Killed'])
                succesful_attacks = int(row['Attack_Success'])
                attack_total=int(row['Attack_Total'])
                score = float(row['Score'])
                success = int(row['Success'])
                print("{},{},{},{},{},{}".format(iteration_numbers
                                                ,time_elsapsed
                                                ,kills
                                                ,succesful_attacks
                                                ,attack_total
                                                ,score
                                                ,success))
                if 60 <= count:
                    break
        except csv.Error:
            print(csv_file)
