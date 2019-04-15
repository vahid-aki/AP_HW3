CXX = g++
CXXFLAGS = -std=c++17 -Wall -c
LXXFLAGS = -std=c++17
OBJECTS = q1.o Maxheap.o
TARGET = q1


$(TARGET): $(OBJECTS)
	$(CXX) $(LXXFLAGS) $(OBJECTS) -o $(TARGET)
q1.o: q1.cpp
	$(CXX) $(CXXFLAGS) q1.cpp
Maxheap.o: Maxheap.cpp Maxheap.h
	$(CXX) $(CXXFLAGS) Maxheap.cpp
clean:
	rm -f $(TARGET) $(OBJECTS)
