function tests = test_lansvd
  tests = functiontests(localfunctions);
end

function A = mat_simple1_1(n)
    m = 200;
    if nargin < 1
        n = 50;
    end
    U0 = orth(randn(m));
    V0 = orth(randn(n));
    S0 = zeros(m, n);
    for i=1:n
        S0(i,i) = m / (i);
    end
    A = U0*S0*V0';
end

function verify_lansvd(A, k, testCase)
    S1 = svds(A, k);
    options.verbosity = 0;
    S2 = spx.fast.lansvd(A, k, options);
    verifyEqual(testCase, S1, S2, 'RelTol', 1e-8);
end

function test_1(testCase)
    verify_lansvd(spx.data.mtx_mkt.abb313, 4, testCase);
    verify_lansvd(spx.data.mtx_mkt.abb313, 10, testCase);
end
function test_2(testCase)
    verify_lansvd(spx.data.mtx_mkt.illc1850, 4, testCase);
    verify_lansvd(spx.data.mtx_mkt.illc1850, 10, testCase);
end

function test_3(testCase)
    verify_lansvd(mat_simple1_1(20), 4, testCase);
end

function test_4(testCase)
    verify_lansvd(mat_simple1_1(50), 10, testCase);
end