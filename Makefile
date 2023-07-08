.PHONY: build

build: setup.py
	python3 setup.py build_ext --inplace && python3 setup.py sdist

wheel: build
	python3 setup.py bdist_wheel

.PHONY: upload

upload:
	python3 -m twine upload --repository pypi dist/*

.PHONY: upload-test

upload-test:
	python3 -m twine upload --repository testpypi dist/*

.PHONY: clean

clean:
	rm -rf build dist faster_fifo.egg-info && rm -f *.so faster_fifo.cpp

.PHONY: test

test:
	python3 -m unittest
