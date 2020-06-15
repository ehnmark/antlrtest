package com.github.ehnmark.antlrtest;

import java.util.*;

import com.github.ehnmark.SbeText.*;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Main {

    public static class Listener extends SbeTextBaseListener {
        @Override
        public void enterMessageType(SbeTextParser.MessageTypeContext ctx) {
            var messageType = ctx.PRIMITIVE().getSymbol().getText();
            System.out.println("message type " + messageType);
        }

        @Override
        public void enterKey(SbeTextParser.KeyContext ctx) {
            var key = ctx.PRIMITIVE();
            System.out.println("key " + key);
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length < 1) {
            System.err.println("Required: input file");
            System.exit(1);
        }
        var path = args[0];
        var stream = CharStreams.fromFileName(path);
        var lexer = new SbeTextLexer(stream);
        var tokens = new CommonTokenStream(lexer);
        var parser = new SbeTextParser(tokens);
        var tree = parser.message();
        var walker = new ParseTreeWalker();
        var listener = new Listener();
        walker.walk(listener, tree);
    }
 }