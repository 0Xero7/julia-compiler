
@enum ASTTypeFlags fInteger=1 fFloat=2 fBinOp=3 fExpr=4

mutable struct ASTTypeInfo
    # Store the flags in a int64
    flags::Int64
    ASTTypeInfo() = new(0)
end
export ASTTypeInfo


function setFlag(arg::ASTTypeInfo, flag::ASTTypeFlags)
    arg.flags = arg.flags | (1 << Int(flag))
end


function MakeTypeInfo(typeFlags...)
    ret = ASTTypeInfo()
    for flag in typeFlags
        setFlag(ret, flag)
    end
    return ret
end
export MakeTypeInfo