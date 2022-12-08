def main():
    elfs = [0]
    with open("input.txt", "r") as file:
        index = 0
        for line in file:
            line = line.replace("\n", "")
            if line == "":
                index += 1
                elfs.append(0)
                continue
            elfs[index] += int(line)
    elfs.sort()
    print(elfs[-1], " max calories")
    print(sum(elfs[-3:]), "top 3 total calories")
    
            
if __name__ == "__main__":
    main()
