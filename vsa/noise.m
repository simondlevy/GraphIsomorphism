function a = noise(varargin)
%    V = NOISE(M, N)
%    V = NOISE(SIZ)

a = 2 * (rand(varargin{:}) < 0.5) - 1;



