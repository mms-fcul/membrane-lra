import sys

with open(sys.argv[1]) as f:
    lines = f.readlines()
    for i, col in enumerate(lines[0].split()):
        if col == sys.argv[2]:
            print(i + 1)
            exit()
raise Exception({sys.argv[2]} + ' site not found')