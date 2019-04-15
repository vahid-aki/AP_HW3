CXX = g++
CXXFLAGS = -std=c++17 -Wall -c
LXXFLAGS = -std=c++17
OBJECTS = q3.o human.o oracle.o
TARGET = q3


$(TARGET): $(OBJECTS)
	$(CXX) $(LXXFLAGS) $(OBJECTS) -o $(TARGET)
q3.o: q3.cpp
	$(CXX) $(CXXFLAGS) q3.cpp
human.o: human.cpp human.h
	$(CXX) $(CXXFLAGS) human.cpp
oracle.o: oracle.cpp oracle.h human.h
	$(CXX) $(CXXFLAGS) oracle.cpp
clean:
	rm -f $(TARGET) $(OBJECTS)
