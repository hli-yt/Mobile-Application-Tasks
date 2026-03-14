int findMax(List<int> numbers) {
  if (numbers.isEmpty) {
    print('List is empty');
    return -1;   }
  
  // Initial max with the first element
  int max = numbers[0];
  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > max) {
      max = numbers[i];
    }
  }
  return max;
}

int findMin(List<int> numbers) {
  if (numbers.isEmpty) {
    print('List is empty');
    return -1;
  }
  
  // Initial min with the first element
  int min = numbers[0];
  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] < min) {
      min = numbers[i];
    }
  }
  return min;
}

int calculateSum(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error: Cannot calculate sum of an empty list');
    return 0;
  }
  
  int sum = 0;
  
  // Using for-in loop to iterate through all elements
  for (int number in numbers) {
    sum += number;
  }
  return sum;
}

double calculateAverage(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error: Cannot calculate average of an empty list');
    return 0.0; 
  }
  
  int sum = calculateSum(numbers);
  
  double average = sum / numbers.length;
  return average;
}

int countNegatives(List<int> numbers) {
  int count = 0;
  for (int number in numbers) {
    if (number < 0) {
      count++;
    }
  }
  return count;
}

List<int> sortAscending(List<int> numbers) {
  List<int> sorted = List.from(numbers);
  
  for (int i = 0; i < sorted.length - 1; i++) {
    for (int j = 0; j < sorted.length - i - 1; j++) {
      if (sorted[j] > sorted[j + 1]) {
        int temp = sorted[j];
        sorted[j] = sorted[j + 1];
        sorted[j + 1] = temp;
      }
    }
  }
  return sorted;
}

int findMaxBuiltIn(List<int> numbers) {
  if (numbers.isEmpty) return -1;
  return numbers.reduce((curr, next) => curr > next ? curr : next);
}

int findMinBuiltIn(List<int> numbers) {
  if (numbers.isEmpty) return -1;
  return numbers.reduce((curr, next) => curr < next ? curr : next);
}

int calculateSumBuiltIn(List<int> numbers) {
  return numbers.fold(0, (sum, element) => sum + element);
}

double calculateAverageBuiltIn(List<int> numbers) {
  if (numbers.isEmpty) return 0.0;
  return numbers.reduce((a, b) => a + b) / numbers.length;
}

void main() {
  final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];
  
  int maxValue = findMax(numbers);
  int minValue = findMin(numbers);
  int sum = calculateSum(numbers);
  double average = calculateAverage(numbers);
  
  int negativeCount = countNegatives(numbers);
  
  List<int> sortedNumbers = sortAscending(numbers);
  
  print('Number Analysis Results');
  print('Numbers: $numbers');
  print('Maximum value : $maxValue');
  print('Minimum value : $minValue');
  print('Sum : $sum');
  print('Average : $average');
  
 
  print('\n--- Bonus Features ---');
  print('Negative count: $negativeCount');
  print('Sorted ascending: $sortedNumbers');
  
}

// Q1. What is the difference between a List<int> and a List<dynamic> in Dart?
// Why is it usually better to use a typed list like List<int>?
// A List<int> can only contain integer values, while a List<dynamic> can contain
// values of any type. Using a typed list like List<int> is better because it
// provides type safety, prevents runtime errors from unexpected types, enables
// better IDE support with autocomplete, and makes the code self-documenting.

// Q2. In your findMax() function, why is it important to initialize your 
// 'running maximum' variable to the first element of the list rather than to 0
// or to a very small number? What could go wrong with the other approaches?
// Initializing to the first element ensures correctness because if all numbers
// are negative, starting from 0 would incorrectly return 0 as the maximum.
// Similarly, starting from a very small number assumes knowledge about the data
// range, which may not always be valid. Using the first element guarantees we
// start with an actual value from the dataset.

// Q3. Your calculateAverage() function calls calculateSum() internally. What 
// software design principle does this demonstrate, and why is reusing existing
// functions preferable to duplicating code?
// This demonstrates the DRY (Don't Repeat Yourself) principle. Reusing existing
// functions reduces code duplication, makes maintenance easier (fixing a bug in
// one place fixes it everywhere), and ensures consistency across the codebase.

// Q4. Describe in plain English what the for-in loop syntax does in Dart. How
// is it different from a traditional for loop with an index? When would you
// prefer one over the other?
// The for-in loop iterates directly over each element in a collection without
// needing an index variable. A traditional for loop uses an index to access
// elements by position. For-in is preferred when you need to process every
// element sequentially and don't need the index position. Traditional for loops
// are better when you need the index, need to iterate in reverse, or need to
// skip elements.

// Q5. If someone calls your findMax() function with an empty list, what happens?
// How could you modify the function to handle that case safely?
// With an empty list, the function would throw an error when trying to access
// numbers[0]. To handle this safely, we can check if the list is empty at the
// start and either return a special value (like null or -1) or throw a
// meaningful exception with a clear message.
