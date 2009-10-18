%%
%% Resource application file
%%
%% File: template_app.app
%%

{application, template_app,
 [{description, "Template application version 1.0"},
  {vsn, "1.0"},
  {modules, [template_sup, template_app, template_server]},
  {registered, [template_sup]},
  {applications, [kernel, stdlib, sasl]},
	{env, [{var1, "Value of environment variable 1"}]}
  {mod, {template_app, []}}
 ]}.
