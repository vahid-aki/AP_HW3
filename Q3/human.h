#ifndef HUMAN_H
#define HUMAN_H

#include<iostream>
#include<string>

class Human {
 public:
  Human(std::string firstName, std::string lastName, int hairColor, int eyeColor, int age, bool gender, int numberofChildren);
  Human();
  ~Human();
  
  std::string getFirstName() { return FirstName; }
  std::string getLastName() { return LastName; }
  bool getGender() { return Gender; }
  int getHairColor() { return HairColor; }
  int getEyeColor() { return EyeColor; }
  int getAge() { return Age; }

  bool isChildOf(Human*);
  bool isFatherOf(Human* human) {return human->father == this ? true : false; }
  bool isMotherOf(Human* human) {return human->mother == this ? true : false; }
  void printChildren();

  Human* operator+(Human*&);
  Human* operator=(const Human*& human);
  Human* operator=(Human*&& human);
  void operator++(int);// { Age++; }

  void addchild(Human* child);
 private:
  std::string FirstName;
  std::string LastName;
  int HairColor;
  int EyeColor;
  int Age;
  bool Gender;
  int NumberOfChildren;

 public:
  void setFirstName(const std::string& name) { FirstName = name; }
  void setLastName(const std::string& lastname) { LastName = lastname; }
  void setGender(int i) { Gender = i; }
  void setHairColor(int i) { HairColor = i; }
  void setEyeColor(int i) { EyeColor = i; }
  void setAge(int i) { Age = i; }
  
  Human** arr;
  Human* father;
  Human* mother;
  Human* spouse;
};

#endif
