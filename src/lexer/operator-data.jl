
operators = Dict()

operators["="] = -1
operators[":"] = -1
operators["("] = -1
operators[")"] = -1

operators["\""] = 0
operators["."] = 0
operators[","] = 0
operators["#"] = 0

operators["+"] = 0
operators["-"] = 0
operators["*"] = 1
operators["/"] = 1

operators["%"] = 2

operators["++"] = 5
operators["--"] = 5


function getOperatorRegexString() :: Regex
    ops = []
    for i in keys(operators)
        op = ""
        for j in string(i) op = op * "\\" * j end
        push!(ops, op)
    end

    sort!(ops, by=length, rev=true)

    regex = ""
    for i in ops
        regex = regex * "($i)|"
    end
    return Regex(chop(regex))
end