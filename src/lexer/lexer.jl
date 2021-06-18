module Lexer
    include("keywords.jl")
    include("operator-data.jl")
    include("token.jl")

    r_patterns = Dict()

    r_patterns[FloatLiteral]        = r"\d+\.\d*"
    r_patterns[IntegerLiteral]      = r"\d+"
    r_patterns[Identifier]          = r"[a-zA-Z_]+[0-9a-zA-Z_]*"
    r_patterns[Whitespace]          = r"([ \t\r]*[\n])|([ \t]*)"
    r_patterns[Operator]            = getOperatorRegexString()

    function tryMatch(rawToken)
        for i in keys(r_patterns)
            m = match(r_patterns[i], rawToken, 1)
            if isnothing(m) continue end

            if m.match == rawToken 
                if i != Identifier return i end
                if rawToken in keywords return Keyword end
                return i
            end
        end

        return nothing
    end


    function lex(source)
        pos = 1
        lastToken = ""
        token = ""
        lineNumber = 1
        newLineNumber = 1

        tokens = Vector{Token}()

        while pos <= length(source)
            token = token * source[pos]
            if source[pos] == '\n' newLineNumber += 1 end

            if !isnothing(tryMatch(token))
                lastToken = token
                pos += 1
                continue
            else
                push!(tokens, Token(tryMatch(lastToken), lastToken, pos - length(lastToken), pos - 1, lineNumber, length(lastToken)))
                lastToken = string(source[pos])
                token = string(source[pos])
                pos += 1
                lineNumber = newLineNumber
            end
        end
        
        push!(tokens, Token(tryMatch(lastToken), lastToken, pos - length(lastToken), pos - 1, lineNumber, length(lastToken)))
        return tokens
    end

    export lex

end