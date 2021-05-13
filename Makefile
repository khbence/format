.PHONY: build push format

build:
	docker build . -t khbence/format

push: build
	docker push khbence/format

format:
	find /app/src -iname *.cpp | xargs clang-format -i
	find /app/include -iname *.h -o -iname *.hpp | xargs clang-format -i
	find /app/test -iname *.h -o -iname *.hpp -o -iname *.cpp | xargs clang-format -i
	cmake-format --tab-size 4 --line-ending unix --line-width 128 -i /app/CMakeLists.txt
	find /app/cmake -iname *.cmake | xargs cmake-format --tab-size 4 --line-width 128 --line-ending unix -i
	find /app/src -iname CMakeLists.txt | xargs cmake-format --tab-size 4 --line-width 128 --line-ending unix -i
	find /app/test -iname CMakeLists.txt | xargs cmake-format --tab-size 4 --line-width 128 --line-ending unix -i