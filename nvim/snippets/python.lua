local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("def", {
        t("def "), i(1, "name"), t("("), i(2), t("):"),
        t({ "", "\t" }), i(0, "pass"),
    }),

    s("adef", {
        t("async def "), i(1, "name"), t("("), i(2), t("):"),
        t({ "", "\t" }), i(0, "pass"),
    }),

    s("cls", {
        t("class "), i(1, "Name"), t(":"),
        t({ "", "\tdef __init__(self" }), i(2), t("):"),
        t({ "", "\t\t" }), i(0, "pass"),
    }),

    s("if", {
        t("if "), i(1, "condition"), t(":"),
        t({ "", "\t" }), i(0, "pass"),
    }),

    s("ife", {
        t("if "), i(1, "condition"), t(":"),
        t({ "", "\t" }), i(2, "pass"),
        t({ "", "else:", "\t" }), i(0, "pass"),
    }),

    s("elif", {
        t("elif "), i(1, "condition"), t(":"),
        t({ "", "\t" }), i(0, "pass"),
    }),

    s("for", {
        t("for "), i(1, "item"), t(" in "), i(2, "items"), t(":"),
        t({ "", "\t" }), i(0, "pass"),
    }),

    s("fore", {
        t("for "), i(1, "i"), t(", "), i(2, "item"), t(" in enumerate("), i(3, "items"), t("):"),
        t({ "", "\t" }), i(0, "pass"),
    }),

    s("while", {
        t("while "), i(1, "condition"), t(":"),
        t({ "", "\t" }), i(0, "pass"),
    }),

    s("try", {
        t("try:"),
        t({ "", "\t" }), i(1, "pass"),
        t({ "", "except " }), i(2, "Exception"), t(" as "), i(3, "e"), t(":"),
        t({ "", "\t" }), i(0, "pass"),
    }),

    s("with", {
        t("with "), i(1, "expr"), t(" as "), i(2, "var"), t(":"),
        t({ "", "\t" }), i(0, "pass"),
    }),

    s("lc", {
        t("["), i(1, "x"), t(" for "), i(2, "x"), t(" in "), i(3, "items"), t("]"),
    }),

    s("dc", {
        t("{"), i(1, "k"), t(": "), i(2, "v"), t(" for "), i(3, "k"), t(", "), i(4, "v"), t(" in "), i(5, "items"), t("}"),
    }),

    s("main", {
        t({ "def main():", "\t" }), i(0, "pass"),
        t({ "", "", "", "if __name__ == \"__main__\":", "\tmain()" }),
    }),

    s("imp", {
        t("import "), i(0),
    }),

    s("from", {
        t("from "), i(1, "module"), t(" import "), i(0),
    }),

    s("lam", {
        t("lambda "), i(1, "x"), t(": "), i(0),
    }),
}
