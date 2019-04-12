#ifndef VECTOR_H
#define VECTOR_H

#include<iostream>

class Vector {
 public:
  Vector(); // the constructor
  Vector(const Vector& vector);
  Vector(Vector&& Vector);
  ~Vector(); // the destructor

  Vector& operator=(const Vector& vector);
  Vector& operator=(Vector&& vector);
  Vector operator+(const Vector& vector) const;
  Vector& operator+=(const Vector& vector);
  int operator*(const Vector& vector) const;
  int& operator[](int index); // the indexing operation
  bool operator<(const Vector& vector) const; // the < operation
  bool operator==(const Vector& vector) const; // the < operation
  
  void push_back(int val); // add a new value to the end
  void pop_back(); // delete the last value from the end

  void show();

 private:
  int *pa; // points to the array
  int capacity; // the # elements
  int nextIndex; // the next highest index value or the size of vector

};


#endif
