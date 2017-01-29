package jawan.expr.macro;

import haxe.macro.Context;
import haxe.macro.Expr;

import jawan.expr.ECall;

class FactoryMacro
{
    public static function build():Array<Field>
    {
        try {
            trace('Before hang');
            var type = Context.getType("ECall");
            trace('After hang');
        } catch(e:String) {
            throw e;
        }

        return Context.getBuildFields();
    }
}