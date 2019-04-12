#include"oracle.h"

Oracle::Oracle(std::string Name) : Human{Name,"",0,0,0,0,0} {
  this->Name = Name;
}

bool Oracle::marry(Human* boy, Human* girl) {
  if((boy->getAge() < 18) && (girl->getAge() < 18)) {
    std::cout << "boy or girl ages are lower than 18 and are not allowed to" << std::endl;
    return false;
  }
  if((boy->spouse == nullptr) && (girl->spouse == nullptr)) {
    boy->spouse = girl;
    girl->spouse = boy;
    return true;
  }
  else
    return false;
}

void Oracle::setChild(Human* child, Human* Mother, Human* Father) {
  child->father = Father;
  child->mother = Mother;
  Mother->addchild(child);
  Father->addchild(child);
}
