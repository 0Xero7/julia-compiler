module Parser
    include("../ast/ast.jl")

    function test(t::String)
        return AST.ASTBinOp("+", AST.ASTInteger(t), AST.ASTInteger("70"))
    end

    export test
end