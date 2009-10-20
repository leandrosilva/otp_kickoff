%%
%% Resource application file
%%
%% File   : test_handler.erl
%% Created: 2009-10-19
%%
%% @author leandro <leandrodoze@gmail.com>
%% @copyright 2009 leandro
%%
%% @doc TODO make nice description
%%

{application, test_app,
 [{description, "Test application version 1.0"},
  {vsn, "1.0"},
  {modules, [test_sup, test_app, test_server]},
  {registered, [test_sup]},
  {applications, [kernel, stdlib, sasl]},
	{env, [{var1, "Value of environment variable 1"}]}
  {mod, {test_app, []}}
 ]}.
