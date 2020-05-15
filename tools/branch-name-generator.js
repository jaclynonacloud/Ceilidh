/**
 * This file helps generate branch names.  You'll need nodejs installed to make this work. : )
 * Once you have it, run...
 * @example node tools/branch-name-generator.js
 * And follow the instructions.
 */
const readline = require('readline');

const CODE = "CE";

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

const startGenerator = async () => {
    let type = await new Promise(res => rl.question("Enter issue type (f|b|t): ", ans => res(ans)));
    let text = await new Promise(res => rl.question("Enter issue title: ", ans => res(ans)));
    const num = await new Promise(res => rl.question("Enter issue number (optional): ", ans => res(ans)));

    rl.close();

    // clean type
    switch(type) {
        case "f":
            type = "feature";
            break;
        case "b":
            type = "bugfix";
            break;
        case "t":
            type = "task";
            break;
        default:
            type = "feature";
    }

    // clean text
    text = text
        .replace(/['|"]/g, "")
        .replace(/\W/g, " ")
        .trim()
        .replace(/\s/g, "-")
        .replace(/[_]+/g, "-")
        .toLowerCase();

    // respond with generator name
    console.log('-- RENAME --');
    if(text === "") return void console.warn("Not enough data supplied.");

    if(num === "") return void console.log(`${type}/${CODE}-${text}`);
    return void console.log(`${type}/${CODE}-${num}-${text}`);
};


startGenerator();