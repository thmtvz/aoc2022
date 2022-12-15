import fs from "node:fs/promises";

(async function main(){
    let totalOverlaps = 0;
    let partialOverlaps = 0;
    let elfPairs = await fs.readFile("input");
    
    elfPairs = elfPairs.toString().split("\n");
    elfPairs.pop();

    for(let assignment of elfPairs){
	let [sect1, sect2] = assignment.split(",").map((e) => e.split("-").map(e => parseInt(e)));
	if((sect1[0] >= sect2[0] && sect1[1] <= sect2[1]) ||
	   (sect1[0] <= sect2[0] && sect1[1] >= sect2[1]))
	    ++totalOverlaps;
	if((sect1[1] >= sect2[0] && sect1[0] <= sect2[1]) ||
	   (sect1[0] <= sect2[1] && sect1[1] >= sect2[0]))
	    ++partialOverlaps;
    }
    
    console.log(totalOverlaps);
    console.log(partialOverlaps);
})()
