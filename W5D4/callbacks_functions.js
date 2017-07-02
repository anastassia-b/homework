//simple timeout

window.setTimeout(function () {
  alert('Hammer Timmeeee');
}, 3000);

// timeout with a closure

function hammerTime (time) {
  window.setTimeout(function () {
    alert(`${time} is Hammer TIME!`);
  }, 3000);
}

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  reader.question('Would you like some tea? ', function (res) {
    console.log(`You replied ${res}.`);
    reader.question('Would you like some biscuits? ', function (res2) {
      console.log(`You replied ${res2}.`);

      const first = (res === 'yes') ? 'do' : 'don\'t';
      const second = (res2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
      reader.close();
    });
  });
}

// teaAndBiscuits();

function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodle';
  this.age = 5;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}`);
};
const Markov = new Cat ();
const Noodle = new Dog ();

Markov.chase(Noodle);
Noodle.chase.call(Markov, Noodle);
Noodle.chase.apply(Markov, [Noodle]);
