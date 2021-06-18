
struct ASTInteger
    typeFlag::ASTTypeInfo

    value::String

    ASTInteger(val::String) = new(MakeTypeInfo(fInteger), val)
end
export ASTInteger