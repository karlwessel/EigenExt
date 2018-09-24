module EigenExt

using LinearAlgebra
import Base: \, *

\(E::Eigen, A::AbstractVecOrMat) = E.vectors*(inv(Diagonal(E.values))*(E.vectors\A))
*(E::Eigen, A::AbstractVecOrMat) = E.vectors*(Diagonal(E.values)*(E.vectors\A))

end # module
