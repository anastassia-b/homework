function Cat (name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function () {
  return (`${this.owner} loves ${this.name}.`);
};

const cat1 = new Cat('Anna', 'Bob');
const cat2 = new Cat('Comb', 'Doodle');

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());

Cat.prototype.meow = function () {
  return 'meow';
};

console.log(cat1.meow());

cat1.meow = function () {
  return 'purrrr';
};

console.log(cat1.meow());
console.log(cat2.meow());
