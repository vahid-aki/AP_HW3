#include <iostream>
#include "human.h"
#include "oracle.h"

int main() {


  Human* p1{new Human {"ALI", "BAHADORI", 4, 3, 25, 0, 0}};
  Human* p2{new Human {"BAHAR", "SHAMS", 1, 2, 22, 1, 0}};

  Human* p3{new Human};
  Oracle o1{"SHERVIN"};

  //married couple
  std::cout << o1.marry(p1, p2) << std::endl;
  
  std::cout << p1->isFatherOf(p2) << std::endl;
    
  //creating new person
  p3->operator=(p1->operator+(p2));
    
  //setting the firstname of newborn
  if(p3->getGender())
    p3->setFirstName("MAHSHID");
  else
    p3->setFirstName("FARSHID");

    
  //increasing the age of newborn
  p3->operator++(1);
    
  Human* p4{new Human {"SHAHIN", "REZAEE", 0, 5, 58, 1, 1}};
  Human* p5{new Human {"FARHAD", "BAHADORI", 0, 6, 63, 0, 1}};


  o1.setChild(p4, p1, p2);
  p1->printChildren();
  /*
    if(o1.isFamily(p3, p5)) {
    std::cout << "the population of family is: " << o1.getPopulationOfFamily(p4) << endl;
    Human** f1{o1.getFamily(p3)};
    std::cout << "the name of each member of family: " ;
    for(int i{0}; i < o1.getPopulationOfFamily; i++) {
    std::cout << f1[i]->getFirstName() << " ";
    }
    std::cout << endl;
    }

  */
  return 0;
}
