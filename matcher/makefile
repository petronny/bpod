all:clean matcher run
clean:
	rm -f matcher
matcher:matcher.cpp
	g++ matcher.cpp -o matcher `pkg-config --cflags --libs opencv`
run:matcher
	./matcher ../image/20160902/MoscowSkyline_ZH-CN10266976296_1920x1200.jpg ../image/20160902/MoscowSkyline_ZH-CN10266976296_540x900.jpg
