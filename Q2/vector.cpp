#include"vector.h"
#include <exception>

Vector::Vector() {
  pa = new int[1];
  for (int i {}; i < 1; i++)
    pa[i] = 0;
  capacity = 1;
  nextIndex = 0;
}

Vector::Vector(const Vector& vector) : capacity{vector.capacity}, nextIndex{vector.nextIndex} {
  pa = new int[capacity];
  for(int i{}; i < nextIndex; i++)
    pa[i] = vector.pa[i];
}

Vector::Vector(Vector&& vector) : capacity{vector.capacity}, nextIndex{vector.nextIndex} {
  pa = vector.pa;
  vector.pa  = nullptr;
}

Vector Vector::operator+(const Vector& vector) const {
    if(vector.nextIndex != this->nextIndex)
      throw std::out_of_range{"size of two vector's that you entered are not equel"};
    Vector copy{*this};
    for(int i{}; i < nextIndex; i++)
      copy.pa[i] += vector.pa[i];
    return copy;
}
Vector& Vector::operator+=(const Vector& vector) {
  if(vector.nextIndex != this->nextIndex)
    throw std::out_of_range{"size of two vector's that you entered are not equel"};
  for(int i{}; i < nextIndex; i++)
    pa[i] += vector.pa[i];
  return *this;
}

Vector& Vector::operator=(const Vector& vector) {
  if(this == &vector)
    return *this;
  capacity = vector.capacity;
  nextIndex = vector.nextIndex;
  delete[] pa;
  for(int i{}; i < nextIndex; i++)
    pa[i] = vector.pa[i];
  return *this;
}

Vector& Vector::operator=(Vector&& vector) {
  if(this == &vector)
    return *this;
  delete[] pa;
  pa = vector.pa;
  vector.pa = nullptr;
  return *this;
}

int Vector::operator*(const Vector& vector) const {
  if(vector.nextIndex != this->nextIndex)
    throw std::out_of_range{"size of two vector's that you entered are not equel"};
  int mul{};
  for(int i{}; i < nextIndex; i++) 
    mul = mul + (this->pa[i] * vector.pa[i]);
  return mul;
}

int& Vector::operator[](int index) {
  if (index >= capacity) { // is element in the array?
    for(int i{1}; i < index;)
      {
	i *=2;
	capacity = i; // set length to bigger size
      }
    int *pnewa; // pointer for new array
    pnewa = new int[capacity]; // allocate a bigger array
    for (int i = 0; i < nextIndex; i++) // copy old values
      pnewa[i] = pa[i];
    for (int j = nextIndex; j < capacity; j++) // initialize remainder
      pnewa[j] = 0;
    
    delete [] pa; // delete the old array
    pa = pnewa; // reassign the new array
  }
  if (index >= nextIndex) // set nextIndex past index
    nextIndex = index + 1;
  
  return *(pa + index); // a reference to the element
}

void Vector::push_back(int val) {
  if (nextIndex == capacity) {
    capacity *= 2;
    int *pnewa;
    pnewa = new int[capacity];
    for (int i = 0; i < nextIndex; i++)
      pnewa[i] = pa[i];
    for (int j = nextIndex; j < capacity; j++)
      pnewa[j] = 0;
    delete [] pa;
    pa = pnewa;
  }
  pa[nextIndex++] = val;
}

void Vector::pop_back() {
  pa[nextIndex--] = 0;
  if (nextIndex == capacity) {
    capacity /= 2;
  }
}

bool Vector::operator<(const Vector& vector) const {
  return nextIndex < vector.nextIndex;
}

bool Vector::operator==(const Vector& vector) const {
  return nextIndex == vector.nextIndex;
}

void Vector::show() {
  for (int i = 0; i < nextIndex; i++) // get length of array using size()
    std::cout << pa[i] << "\t";  // print out using RHV
  std::cout << std::endl;
}

Vector::~Vector() {
  delete [] pa;
}
