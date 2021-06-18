module JuliaCompiler
    include("lexer/lexer.jl")
    include("parser/parser.jl")
    using JuliaCompiler.Lexer

    function main(filePath)
        file = open(filePath, "r")
        source = read(file, String)

        tokens = lex(source)
        # for i in tokens
        #     println(i)
        # end

        println(Parser.test("5"))
    end
end # module


