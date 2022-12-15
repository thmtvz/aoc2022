package main

import (
	"fmt"
	"bufio"
	"os"
	"strings"
)

func priority(c byte) int {
	if 65 <= c && c <= 90 {
		return int((c - 'A' + 1) + 26)
	} else {
		return int((c - 'a') + 1)
	}
}

func repeatedChar(arr [3]string) byte {
	for i := 0; i < len(arr[0]); i++ {
		if strings.IndexByte(arr[1], arr[0][i]) != -1 &&
			strings.IndexByte(arr[2], arr[0][i]) != -1 {
			return arr[0][i]
		}
	}
	return 0
}

func main(){
	file, err := os.Open("input")
	if err != nil{
		os.Exit(1)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	totalPriority := 0
	badgePriority := 0
	counter := 0
	var cache [3]string
	for scanner.Scan(){
		str := scanner.Text()
		cache[counter] = str
		compartment1, compartment2 := str[:len(str) / 2], str[len(str) / 2:]
		char := compartment1[strings.IndexAny(compartment1, compartment2)]
		totalPriority += priority(char)
		if counter == 2{
			badgePriority += priority(repeatedChar(cache))
			counter = 0
			continue
		}
		counter++
	}
	
	fmt.Println(totalPriority)
	fmt.Println(badgePriority)
}
