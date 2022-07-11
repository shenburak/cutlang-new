import sys
from .ADLVisitor import ADLVisitor

class CLAVisitor(ADLVisitor):
    def __init__(self, dbx, cla):
        self.dbx = dbx
        self.cla = cla

    def visitInitilizationExpr(self, ctx):
        return print("visitInitilizationExpr",self.cla.adl,"adl",ctx, "ctx")

    def visitDefinitionExpr(self, ctx):
        return print("visitDefinitionExpr", ctx.getChild(0).getText(), "ctx.getChild(0).getText()")
