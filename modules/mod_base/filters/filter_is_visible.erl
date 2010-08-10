%% @author Marc Worrell <marc@worrell.nl>
%% @copyright 2010 Marc Worrell
%% @doc 'is_visible' filter, filters a list of ids

%% Copyright 2010 Marc Worrell
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(filter_is_visible).
-export([is_visible/2]).


is_visible(Id, Context) when is_integer(Id) ->
    z_acl:rsc_visible(Id, Context);
is_visible(List, Context) when is_list(List) ->
    lists:filter(fun(Id) -> z_acl:rsc_visible(Id, Context) end,  erlydtl_runtime:to_list(List, Context)).