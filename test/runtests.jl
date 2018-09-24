module EigenTests
using Test
using LinearAlgebra
using EigenExt

@testset "Basic operations" begin
A = rand(3,3)

E = eigen(A)

v = rand(3)
V = rand(3,2)

@test E\v ≈ A\v
@test E\V ≈ A\V

@test E*v ≈ A*v
@test E*V ≈ A*V
end
end
