#include"Maxheap.h"

Maxheap::Maxheap(int* array, int size) {
  for (int i{}; i < size; i++)
    vec.push_back(array[i]);
  
  build_max_heap();
}

Maxheap::Maxheap(const Maxheap& maxheap) : vec{maxheap.vec} {
   build_max_heap();
}

void Maxheap::build_max_heap() {
   for (int i = vec.size() / 2 - 1; i >= 0; i--) 
     max_heapify(vec, vec.size(), i);
}
    
void Maxheap::max_heapify(std::vector<int>& vec, int n, int i) { 
  int largest = i; // Initialize largest as root 
  int l = 2 * i + 1; // left = 2*i + 1 
  int r = 2 * i + 2; // right = 2*i + 2 
  
  // If left child is larger than root 
  if (l < n && vec[l] > vec[largest]) 
    largest = l; 
  
  // If right child is larger than largest so far 
  if (r < n && vec[r] > vec[largest]) 
    largest = r; 
  
  // If largest is not root 
  if (largest != i) { 
    std::swap(vec[i], vec[largest]); 
  
    // Recursively heapify the affected sub-tree 
    max_heapify(vec, n, largest); 
  } 
} 

void Maxheap::add(const int& key) {
  vec.push_back(key);
  build_max_heap();
}


int Maxheap::getHeight() {
  return std::log2(vec.size());
}

// main function to do heap sort 
void Maxheap::Heapsort() { 
  // Build heap (rearrange array) 
   for (int i = vec.size() / 2 - 1; i >= 0; i--) 
    min_heapify(vec, vec.size(), i); 
  
  // One by one extract an element from heap 
   for (int i = vec.size() - 1; i >= 0; i--) { 
    // Move current root to end 
      std::swap(vec[0], vec[i]); 
  
    // call max heapify on the reduced heap 
    min_heapify(vec, i, 0); 
  } 
}

void Maxheap::min_heapify(std::vector<int>& vec, int n, int i) { 
  int smallest = i; // Initialize largest as root 
  int l = 2 * i + 1; // left = 2*i + 1 
  int r = 2 * i + 2; // right = 2*i + 2 
  
  // If left child is larger than root 
  if (l < n && vec[l] < vec[smallest]) 
    smallest = l; 
  
  // If right child is larger than largest so far 
  if (r < n && vec[r] < vec[smallest]) 
    smallest = r; 
  
  // If largest is not root 
  if (smallest != i) { 
    std::swap(vec[i], vec[smallest]); 
  
    // Recursively heapify the affected sub-tree 
    min_heapify(vec, n, smallest); 
  } 
} 

void Maxheap::printArray() {
  std::cout << "sorted array is: ";
  for( size_t i{}; i < vec.size(); i++)
    std::cout << vec[i] << ", ";
  std::cout << std::endl;
}

void Maxheap::Delete() {
  vec.erase(vec.begin());
  build_max_heap();
}

int& Maxheap::operator[](const int& i) {
  return vec[i];
}

std::ostream& operator<<(std::ostream& os, const Maxheap& heap) {
  for(size_t i{}, j{2}; i < heap.vec.size(); i++) {
    os << heap.vec[i];
    if(i != heap.vec.size()-1)
      os << ",  ";
    if (i == j-2 )
      {
	os << std::endl;
	j *= 2;
      }
  }
  return os;
}
