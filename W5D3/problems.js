
function madLib(verb, adjective, noun){
  let string = `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`;
  console.log(string)
  return string;
}

function isSubstring(searchString, subString){
  for(let i = 0; i < searchString.length - 1; i++){
    for(let j = i + 1; j < searchString.length; j++){
      let string = searchString.substring(i, j);
      if(string == subString)
        return true;
    }
  }
  return false;
}

function fizzBuzz(array){
  let returnArray = []
  array.forEach((element) => {
    if(element % 3 == 0 && element % 5 == 0){

    }else if(element % 3 == 0 || element % 5 == 0){
      returnArray.push(element)
    }else {

    }
  })
  return returnArray;
}

function isPrime(number){
  let i = 2;
  while(i < number) {
    if(number % i === 0)
      return false;
    i++;
  }
  return true;
}

function sumOfNPrimes(n){
  let i = 2;
  let count = 0;
  let sum = 0;
  while(count < n){
    if(isPrime(i)){
      sum = sum + i;
      count++;
    }
    i++;
  }
  return sum
}

function titleize(array, callback){
  modified_array = array.map((element)=>{
    element = `Mx. ${element} Jingleheimer Schmidt`;
    return element;
  })
  callback(modified_array)
}

function printCallback(array){
  array.forEach((element) =>{
    console.log(element);
  })
}

function Elephant(name, height, tricks){
  this.name = name;
  this.height = height;
  this.tricks = tricks;
  // this.tricks = tricks.map((trick)=>{
  //   let split = trick.split(' ');
  //   split[0] = split[0].slice(0,split[0].length - 4);
  //   return split.join(' ');
  // })
}

Elephant.prototype.trumpet = function (){
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function (){
  this.height = this.height + 12;
}

Elephant.prototype.addTrick = function(trick){
  // let split = trick.split(' ');
  // split[0] = split[0].slice(0, split[0].length - 4);
  // parsed_trick = split.join(' ');
  this.tricks.push(trick);
}

Elephant.prototype.play = function(){
  console.log(`${this.name} is ${this.tricks[getRandomInt(this.tricks.length)]}`);
}

function getRandomInt(max){
  return Math.floor(Math.random() * Math.floor(max));
}

// madLib('make', 'best', 'guac');
//
// console.log(isSubstring("time to program", "time"))
//
// console.log(isSubstring("Jump for joy", "joys"))
//
// console.log(fizzBuzz([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]))
//
// console.log(isPrime(2))
//
// console.log(isPrime(10))
//
// console.log(isPrime(15485863))
//
// console.log(isPrime(3548563))
//
// console.log(sumOfNPrimes(0))
//
//
// console.log(sumOfNPrimes(1))
//
// console.log(sumOfNPrimes(4))
//
// titleize(["Mary", "Brian", "Leo"], printCallback)

// let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
// ellie.trumpet();
// console.log(ellie.height)
// ellie.grow();
// console.log(ellie.height)
// ellie.addTrick("playing hard to get");
// ellie.play();
// ellie.play();
// ellie.play();

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.prototype.paradeHelper = function(elephant){
  console.log(`${this.name} is trotting by!`)
}

herd.forEach((elephant)=>{
  elephant.paradeHelper(elephant);
});

function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
