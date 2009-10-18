%%
%% Application module
%%
%% File: template_app.erl
%%

-module(template_app).
-behaviour(application).
 
-export([start/2, stop/1]).
 
start(_Type, _StartArgs) ->
   case template_sup:start_link() of
      {ok, Pid} ->
          alarm_handler:clear_alarm({application_stopped, ?MODULE}),
          {ok, Pid};
      Error ->
          alarm_handler:set_alarm({{application_stopped, ?MODULE}, []}),
          Error
   end.
 
stop(_State) ->
   alarm_handler:set_alarm({{application_stopped, ?MODULE}, []}),
   ok.
