#include("ast-flags.jl")

struct ASTBinOp
    typeFlag::ASTTypeInfo

    operator::String
    leftExpr
    rightExpr

    ASTBinOp(op::String, left, right) = new(MakeTypeInfo(fExpr, fBinOp), op, left, right)
end
export ASTBinOp