#!/usr/bin/env bash
java -jar antlr-4.13.1-complete.jar Expr.g4 -Dlanguage=CSharp -visitor -listener -o Grammar
