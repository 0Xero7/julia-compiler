include("token-types.jl")

struct Token
    tokenType::TokenType
    value::String

    startPos::Int
    endPos::Int

    lineNumber::Int

    length::Int
end

Base.show(io::IO, f::Token) = print(io, 
    "[$(f.startPos):$(f.endPos)] [$(f.lineNumber)] ($(f.tokenType)) \t'$(escape_string(f.value))'"
)