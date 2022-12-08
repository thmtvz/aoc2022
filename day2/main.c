#include <stdio.h>

int abs(int num){
  if(num > 0) return num;
  return -num;
}

/*
rock = 1
paper = 2
scizor = 3
 */

int main(int argc, char** argv)
{
  char buf[4];
  FILE *file = fopen("input", "r");
  int points_strategy_1 = 0;
  int points_strategy_2 = 0;
  while(fread(buf, 1, 4, file)){
    char elf = buf[0] - 64;
    char you = buf[2] - 23 - 64;
    char result = elf - you;
    if(abs(result) == 2){
      result > 0 ? (points_strategy_1 += (6 + you)) : (points_strategy_1 += you);
    } else if(result != 0){
      result > 0 ? (points_strategy_1 += you) : (points_strategy_1 += (you + 6));
    } else {
      points_strategy_1 += (you + 3);
    }

    
    if(you == 3) points_strategy_2 += 6 + ((elf + 1) > 3 ? 1 : elf + 1 );
    else if(you == 2) points_strategy_2 += (elf + 3);
    else points_strategy_2 += ((elf - 1) <= 0 ? 3 : elf - 1);
  }
  //part 1
  printf("%d\n", points_strategy_1);
  printf("%d\n", points_strategy_2);
  return 0; 
}
