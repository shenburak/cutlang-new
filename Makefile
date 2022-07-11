SHELL := /bin/bash

CUTLANG_DIR=src/cutlang
CUTLANG_PACKAGE_NAME=cutlang

ANTLR=java org.antlr.v4.Tool
GRUN=java org.antlr.v4.gui.TestRig
JAVAC=javac
ADL=ADL
TEST_EXP=prog
EXP_ADL=../../ex.adl

all: configure install

build:
	python -m build

install:
	python setup.py install

configure: configure-cpp #configure-python configure-java
configure-java:
	cd ${CUTLANG_DIR} && ${ANTLR} -Dlanguage=Java ${ADL}.g4 -visitor
	cd ${CUTLANG_DIR} && ${JAVAC} ADL*.java
configure-python:
	cd ${CUTLANG_DIR} && ${ANTLR} -Dlanguage=Python3 ${ADL}.g4 -visitor
configure-cpp:
	cd ${CUTLANG_DIR} && ${ANTLR} -Dlanguage=Cpp ${ADL}.g4 -visitor

grun-tokens:
	cd ${CUTLANG_DIR} && ${GRUN} ${ADL} ${TEST_EXP} ${EXP_ADL} -tokens
grun-gui:
	cd ${CUTLANG_DIR} && ${GRUN} ${ADL} ${TEST_EXP} ${EXP_ADL} -gui

remove: clean
	pip uninstall ${CUTLANG_PACKAGE_NAME}

clean:
	rm -rf dist build src/*.egg-info ${CUTLANG_DIR}/__pycache__
	rm -rf ${CUTLANG_DIR}/*.interp ${CUTLANG_DIR}/*.tokens ${CUTLANG_DIR}/${ADL}Lexer.py ${CUTLANG_DIR}/${ADL}Listener.py ${CUTLANG_DIR}/${ADL}Parser.py ${CUTLANG_DIR}/${ADL}Visitor.py
	rm -rf ${CUTLANG_DIR}/.antlr
	rm -rf ${CUTLANG_DIR}/*.java ${CUTLANG_DIR}/*.class