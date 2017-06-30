function range(start, end) {
  if (start === end) {
    return [];
  }
  let r = range(start, end - 1);
  r.push(end - 1);
  return r;
}

console.log(`range(2, 7) = ${range(2, 7)}`);

function sumRec(numbers) {
  if (numbers.length === 0) {
    return 0;
  }

  let lastNum = numbers[numbers.length - 1];
  return sumRec(numbers.slice(0, numbers.length - 1)) + lastNum;
}

console.log(`sumRec([2, 3, 4]) = ${sumRec([2, 3, 4])}`);

function sumIter(numbers) {
  let sum = 0;

  numbers.forEach(function (number) {
    sum += number;
  });

  return sum;
}

console.log(`sumIter([3, 4, 5]) = ${sumIter([3, 4, 5])}`);

function fibsRec(n) {
  if (n < 3) {
    return [0, 1].slice(0, n);
  }

  let fibs = fibsRec(n - 1);
  fibs.push(fibs[fibs.length - 1] + fibs[fibs.length - 2]);

  return fibs;
}

console.log(`fibsRec(5) = ${fibsRec(5)}`);

function fibsItr(n) {
  let fibs = [0, 1];
  if (n < 3) {
    return fibs.slice(0, n);
  }

  while (fibs.length < n) {
    fibs.push(fibs[fibs.length - 2] + fibs[fibs.length - 1]);
  }

  return fibs;
}

console.log(`fibsRec(7) = ${fibsRec(7)}`);

function binarySearch(numbers, target) {
  if (numbers.length === 0) {
    return -1;
  }

  const probeIdx = Math.floor(numbers.length / 2);
  const probe = numbers[probeIdx];

  if (target === probe) {
    return probeIdx;
  } else if (target < probe) {
    const left = numbers.slice(0, probeIdx);
    return binarySearch(left, target);
  } else {
    const right = numbers.slice(probeIdx + 1);
    const subProblem = binarySearch(right, target);

    return subProblem === -1 ? -1 : subProblem + (probeIdx + 1);
  }
}


console.log(`binarySearch([1, 2, 3, 4, 5, 6], 6) = ${binarySearch([1, 2, 3, 4, 5, 6], 6)}`);
console.log(`binarySearch([1, 2, 3], 2.5) = ${binarySearch([1, 2, 3], 2.5)}`);
