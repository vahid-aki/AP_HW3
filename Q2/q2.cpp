#include<iostream>
#include"vector.h"
#include<utility>

using namespace std::rel_ops;

int main() {
  Vector da; // create an array object
  da.push_back(1); // add values to the end
  da.push_back(2);
  da.push_back(3);
  da.push_back(4);
  da.push_back(5);
  da.push_back(6);
  da.push_back(7);
  da.push_back(8);
  da.push_back(9);
  da.show();
   
  da.pop_back();
  da.pop_back();
  da.pop_back();
  da.show();
  
  da.push_back(7);
  da.push_back(8);
  da.push_back(9);
  da.push_back(10);
  da.show();

  da = da + da;
  da.show();

  std::cout << "da*da = " << da*da << std::endl;

  std::cout << "da[3] = " << da[3] << std::endl;

  da[3] = 50;

   std::cout << "da[3] = " << da[3] << std::endl;
  
  Vector vec;
  vec.push_back(100);
  if (da >= vec)
    std::cout << " da's size is greater than or equel to vec's" << std::endl;


  da = vec + da;
  da.show();
  
  return 0;
}
