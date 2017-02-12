module Path exposing (..)

import FFI


{-|
    >>> join ["/", "foo", "bar"]
    "/foo/bar"

    >>> join []
    ""

    >>> join ["foo"]
    "foo"

    >>> join ["foo/", "/bar"]
    "foo/bar"
-}
join : List String -> String
join paths =
    FFI.sync """
var path = require('path');
return path.join(_0);
    """
        [ Json.list <| List.map Json.string paths ]
        |> Result.withDefault ""
