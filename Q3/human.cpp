#include"human.h"

Human::Human(std::string firstName, std::string lastName, int hairColor, int eyeColor, int age, bool gender, int numberofChildren) : FirstName{firstName}, LastName{lastName}, HairColor{hairColor}, EyeColor{eyeColor}, Age{age}, Gender{gender}, NumberOfChildren{numberofChildren} {
  if(numberofChildren > 0)
    arr = new Human* [numberofChildren];
  else
    arr = nullptr;
  spouse = nullptr;
  father = nullptr;
  mother = nullptr;
}

Human::Human() : Human("","",0,0,0,0,0) {
}

Human::~Human() {
  delete[] arr;
}

Human* Human::operator+(Human*& human) {
  Human* child{new Human};
  std::srand (time(NULL));
  child->Age = 0;
  int v1 = std::rand() % 100;
       
  child->LastName = (this->Gender) ? this->LastName : human->LastName;
  child->Gender = (v1 % 2) ? this->Gender : human->Gender;
  child->HairColor = (v1 % 3) ? this->HairColor : human->HairColor;
  child->EyeColor = ((v1 % 5) || (v1 % 7)) ? this->EyeColor : human->EyeColor;

  return child;      
}


Human* Human::operator=(const Human*& human) {
  FirstName = human->FirstName;
  LastName = human->LastName;
  HairColor = human->HairColor;
  EyeColor = human->EyeColor;
  Age = human->Age;
  Gender = human->Gender;
  NumberOfChildren = human->NumberOfChildren;

  delete[] arr;
  arr = new Human*[NumberOfChildren];
  for(int i{}; i < NumberOfChildren; i++)
    arr[i] = human->arr[i];
  return this; 
}

Human* Human::operator=(Human*&& human) {
  FirstName = human->FirstName;
  LastName = human->LastName;
  HairColor = human->HairColor;
  EyeColor = human->EyeColor;
  Age = human->Age;
  Gender = human->Gender;
  NumberOfChildren = human->NumberOfChildren;

  delete[] arr;
  arr = human->arr;
  human->arr = nullptr;
  return this; 
}

void Human::operator++(int) {
  Age++;
}

void Human::addchild(Human* child) {
  Human** pnew;
  pnew = new Human*[NumberOfChildren+1];
  for (int i {}; i < NumberOfChildren; i++)
    pnew[i] = arr[i];
   
  *(pnew+NumberOfChildren) = child;
  delete[] arr;
  arr = pnew;
  
  NumberOfChildren++;
}

bool Human::isChildOf(Human* human) {
  for(int i{}; i < human->NumberOfChildren; i++)
    if (human->arr[i] == this)
      return true;
  return false;
}

void Human::printChildren() {
  std::cout << "children of " << this->FirstName << " " << LastName << ": ";
  for(int i{}; i < NumberOfChildren; i++) {
    std::cout << arr[i]->FirstName << " " << arr[i]->LastName;
    if(i != NumberOfChildren-1)
      std::cout << ", ";
  }
  std::cout << std::endl;
}
