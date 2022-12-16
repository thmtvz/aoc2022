import std/strutils
import std/sequtils
import std/algorithm

proc reverseString(s: string): string =
  var a = s
  a.reverse
  return a

let file = open("input")
let data = readAll(file)
close(file)

let lines = data.split("\n")
var stacks: seq[string] = @["", "", "", "", "", "", "", "", ""]

for i in 0 ..< 8:
  let line = lines[i]
  for j in countup(1, 33, 4):
    if(line[j..j] != " "):
      stacks[(j - 1) div 4].add(line[j..j])

stacks = map(stacks, reverseString)
var stacks9001 = stacks

for i in 10 .. (len(lines) - 2):
  let
    line = lines[i].split(" ")
    f = parseInt(line[3])
    t = parseInt(line[5])
    q = parseInt(line[1])

  var
    stringFrom = stacks9001[f - 1]
    stringTo = stacks9001[t - 1]
    fromLen = stringFrom.len

  stringTo.add(stringFrom[fromLen - q .. fromLen - 1])
  delete(stringFrom, fromLen - q .. fromLen - 1)
  stacks9001[f - 1] = stringFrom
  stacks9001[t - 1] = stringTo

  for c in countdown(q - 1, 0):
    var
      stringFrom = stacks[f - 1]
      stringTo = stacks[t - 1]
      fromLen = stringFrom.len - 1
      
    stringTo.add(stringFrom[fromLen..fromLen])
    delete(stringFrom, fromLen..fromLen)
    stacks[f - 1] = stringFrom
    stacks[t - 1] = stringTo

proc stringFromTops(s: seq[string]): string =
  var stringTops = ""

  for stack in s:
    stringTops.add(stack[stack.len-1])

  return stringTops

echo stringFromTops(stacks)
echo stringFromTops(stacks9001)
