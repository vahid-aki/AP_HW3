CXX = g++
CXXFLAGS = -std=c++17 -Wall -c
LXXFLAGS = -std=c++17
OBJECTS = q2.o vector.o
TARGET = q2


$(TARGET): $(OBJECTS)
	$(CXX) $(LXXFLAGS) $(OBJECTS) -o $(TARGET)
q2.o: q2.cpp
	$(CXX) $(CXXFLAGS) q2.cpp
vector.o: vector.cpp vector.h
	$(CXX) $(CXXFLAGS) vector.cpp
clean:
	rm -f $(TARGET) $(OBJECTS)
