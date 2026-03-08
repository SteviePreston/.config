local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
    s("fn", {
        t("function "), i(1, "name"), t("("), i(2), t(")"),
        t({ "", "\t" }), i(0),
        t({ "", "end" }),
    }),

    s("lfn", {
        t("local function "), i(1, "name"), t("("), i(2), t(")"),
        t({ "", "\t" }), i(0),
        t({ "", "end" }),
    }),

    s("lf", {
        t("local "), i(1, "name"), t(" = function("), i(2), t(")"),
        t({ "", "\t" }), i(0),
        t({ "", "end" }),
    }),

    s("req", {
        t("local "), i(1, "module"), t(" = require(\""), i(2, "module"), t("\")"),
    }),

    s("if", {
        t("if "), i(1, "condition"), t(" then"),
        t({ "", "\t" }), i(0),
        t({ "", "end" }),
    }),

    s("ife", {
        t("if "), i(1, "condition"), t(" then"),
        t({ "", "\t" }), i(2),
        t({ "", "else", "\t" }), i(0),
        t({ "", "end" }),
    }),

    s("for", {
        t("for "), i(1, "i"), t(" = "), i(2, "1"), t(", "), i(3, "10"), t(" do"),
        t({ "", "\t" }), i(0),
        t({ "", "end" }),
    }),

    s("forp", {
        t("for "), i(1, "k"), t(", "), i(2, "v"), t(" in pairs("), i(3, "table"), t(") do"),
        t({ "", "\t" }), i(0),
        t({ "", "end" }),
    }),

    s("fori", {
        t("for "), i(1, "i"), t(", "), i(2, "v"), t(" in ipairs("), i(3, "table"), t(") do"),
        t({ "", "\t" }), i(0),
        t({ "", "end" }),
    }),

    s("ret", {
        t("return "), i(0),
    }),

    s("loc", {
        t("local "), i(1, "name"), t(" = "), i(0),
    }),

    s("mod", {
        t({ "local M = {}", "", "" }),
        i(0),
        t({ "", "", "return M" }),
    }),
}
