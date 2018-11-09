module EigenExt

using LinearAlgebra
import Base: \, *

struct EigenExt{T,V,Vi,S<:AbstractMatrix,U<:AbstractVector} <: Eigen{T, V, S, U}
    values::U
    vectors::S
    inv_diag::Diagonal{Vi}
    EigenExt{T,V,Vi,S,U}(values::AbstractVector{V}, vectors::AbstractMatrix{T}) where {T,V,Vi,S,U} =
        new(values, vectors, inv(Diagonal(values)))
end
EigenExt(values::AbstractVector{V}, vectors::AbstractMatrix{T}) where {T,V} =
    EigenExt{T,V,typeof(vectors),typeof(values)}(values, vectors)

\(E::Eigen, A::AbstractVecOrMat) = E.vectors*(inv(Diagonal(E.values))*(E.vectors\A))
*(E::Eigen, A::AbstractVecOrMat) = E.vectors*(Diagonal(E.values)*(E.vectors\A))

end # module
