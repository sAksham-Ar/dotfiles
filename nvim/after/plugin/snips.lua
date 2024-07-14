local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = require("luasnip.extras").m
local l = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix

ls.add_snippets("cpp", {
    s("expo", {
        t({
            "long long exponent(long long a, long long b, long long mod){",
            "\tlong long res=1;",
            "\twhile(b>0){",
            "\t\tif (b & 1){",
            "\t\t\tres = (res * a) % mod;",
            "\t\t}",
            "\t\ta = (a * a) % mod;",
            "\t\tb = b >> 1;",
            "\t}",
            "\treturn res;",
            "}"
        }),
    })
})

ls.add_snippets("cpp", {
    s("modmul", {
        t({
            "long long modmul(long long a, long long b, long long mod){",
            "\ta=a%mod;",
            "\tb=b%mod;",
            "\treturn (((a*b) % mod) + mod) % mod;",
            "}"
        })
    })
})

ls.add_snippets("cpp", {
    s("modinv", {
        t({
            "long long modinv(long long a, long long b){",
            "\treturn exponent(a, b-2, b);",
            "}"
        })
    })
})

ls.add_snippets("cpp", {
    s("moddiv", {
        t({
            "long long moddiv(long long a, long long b, long long mod){",
            "\ta=a%mod;",
            "\tb=b%mod;",
            "\treturn (modmul(a, modinv(b, mod), mod) + mod) % mod;",
            "}"
        })
    })
})

ls.add_snippets("cpp", {
    s("oset", {
        t({
            "#include <ext/pb_ds/assoc_container.hpp>",
            "using namespace __gnu_pbds;",
            "typedef tree<int, null_type, less<int>, rb_tree_tag, tree_order_statistics_node_update> ordered_set;"
        })
    })
})
