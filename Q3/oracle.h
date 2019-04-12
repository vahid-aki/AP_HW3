#ifndef ORACLE_H
#define ORACLE_H

#include<iostream>
#include"human.h"

class Oracle : public Human {
 public:
  Oracle(std::string Name);

  bool marry(Human*, Human*);
  void setChild(Human* child, Human* mother, Human* father);
  
 private:
  std::string Name;
};

#endif
