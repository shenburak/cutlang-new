from antlr4 import InputStream, FileStream, CommonTokenStream

from .ADLLexer import ADLLexer
from .ADLParser import ADLParser

from .visitor import CLAVisitor

from .analysis_core import DBX

import os

class CLA:
    def __init__(self, file, adl, isADLFile, events, start, verbose, parallel):
        self.file=file

        if isADLFile:
            if os.path.isfile(adl): self.adl=FileStream(adl)
            else: print(adl + " adl file not found"); exit(1)
        else: self.adl=InputStream(adl)

        self.events=events

        self.start=start

        self.verbose=verbose

        self.parallel=parallel

def interpreter(file, adl, isADLFile, events=0, start=0, verbose=5000, parallel=None):
    newDbx = DBX()
    newCla = CLA(file, adl, isADLFile, events, start, verbose, parallel)
    # lexer
    lexer = ADLLexer(newCla.adl)
    stream = CommonTokenStream(lexer)
    # parser
    parser = ADLParser(stream)
    tree = parser.prog()
    # evaluator
    visitor = CLAVisitor(newDbx, newCla)
    output = visitor.visit(tree)
    print(output, "output")