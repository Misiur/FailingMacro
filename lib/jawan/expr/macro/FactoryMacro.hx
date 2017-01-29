package jawan.expr.macro;

import haxe.macro.Context;
import haxe.macro.Expr;
import sys.FileSystem;

import jawan.expr.ECall;

using StringTools;

class FactoryMacro
{
    private static inline var EXPR_PATH = './lib/jawan/expr';
    private static inline var EXPR_NS = 'jawan.expr.';

    public static function build():Array<Field>
    { 
        //Get All EXxx files from jawan/expr
        var path = FileSystem.absolutePath(Context.resolvePath(EXPR_PATH));
        for(file in FileSystem.readDirectory(path)) {
            if(FileSystem.isDirectory(EXPR_PATH + '/' + file)) {
                continue;
            }
            
            var className = file.split('.')[0];
            //Omit "Factory"
            if(className.startsWith('E')) {
                trace(className);
                trace(EXPR_NS + className);
                try {
                    trace('Before hang');
                    var type = Context.getType(EXPR_NS + className);
                    trace('After hang');
                } catch(e:String) {
                    throw e;
                }
            }
        }

        return Context.getBuildFields();
    }
}