-module(spitest).
-export([test/0]).

test() ->
    spidev:open("/dev/spidev0.0"),
    case spidev:xfer2([104,0]) of
        {ok, [A, B]} ->
            Res = ((A band 3) bsl 8) bor B,
            io:format("Result: ~p~n", [Res]);
        {error, Reason} ->
            io:format("Error: ~p~n", [Reason])
    end,
    spidev:close().
