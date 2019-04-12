#ifndef MAXHEAP_H
#define MAXHEAP_H

#include<iostream>
#include<vector>
#include<cmath>

class Maxheap;
std::ostream& operator<<(std::ostream& os, const Maxheap& heap);

class Maxheap {
 public:
  Maxheap() = default;
  Maxheap(int* array, int size);
  Maxheap(const Maxheap& maxheap);
 
  void add(const int& key);
  int parent(int i) { return vec[(i-1)/2]; }
  int LeftChild(int i) { return vec[2*i + 1]; }
  int RightChild(int i) { return vec[2*i + 2]; }
  int getHeight();
  void Heapsort();
  void printArray();
  int max() { return vec[0]; }
  void Delete();

  int& operator[](const int& i);
   
  std::vector<int> vec;
 
 private:
  void build_max_heap();
  void max_heapify(std::vector<int>& vec, int n, int i);
  void min_heapify(std::vector<int>& vec, int n, int i);
};

#endif
