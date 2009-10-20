%%
%% Start application module
%%
%% File   : test_handler.erl
%% Created: 2009-10-19
%%
%% @author leandro <leandrodoze@gmail.com>
%% @copyright 2009 leandro
%%
%% @doc TODO make nice description
%%

-module(test).
-author('leandro <leandrodoze@gmail.com>')

-export ([start/0, stop/0]).

%% @spec start() -> ok
%% @doc Start the test application
start() ->
	application:start(test).
	
%% @spec stop() -> ok
%% @doc Stop the test application
stop() ->
	application:stop(%=application_name%>).