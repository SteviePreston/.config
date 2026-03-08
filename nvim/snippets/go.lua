local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("fn", {
        t("func "), i(1, "name"), t("("), i(2), t(") "), i(3), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("meth", {
        t("func ("), i(1, "r"), t(" *"), i(2, "Type"), t(") "), i(3, "name"), t("("), i(4), t(") "), i(5), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("main", {
        t({ "func main() {", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("pkg", {
        t("package "), i(0, "main"),
    }),

    s("imp", {
        t("import \""), i(0), t("\""),
    }),

    s("imps", {
        t({ "import (", "\t\"" }), i(0), t({ "\"", ")" }),
    }),

    s("if", {
        t("if "), i(1, "condition"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("ife", {
        t("if "), i(1, "condition"), t(" {"),
        t({ "", "\t" }), i(2),
        t({ "", "} else {", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("iferr", {
        t("if err != nil {"),
        t({ "", "\treturn " }), i(0, "err"),
        t({ "", "}" }),
    }),

    s("for", {
        t("for "), i(1, "i := 0"), t("; "), i(2, "i < n"), t("; "), i(3, "i++"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("forr", {
        t("for "), i(1, "i"), t(", "), i(2, "v"), t(" := range "), i(3, "slice"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("forw", {
        t("for "), i(1, "condition"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("switch", {
        t("switch "), i(1, "expr"), t(" {"),
        t({ "", "case " }), i(2), t(":"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("sel", {
        t({ "select {", "case " }), i(1), t(":"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("struct", {
        t("type "), i(1, "Name"), t(" struct {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("iface", {
        t("type "), i(1, "Name"), t(" interface {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("map", {
        t("map["), i(1, "string"), t("]"), i(0, "interface{}"),
    }),

    s("make", {
        t("make("), i(1, "[]Type"), t(", "), i(2, "0"), t(")"),
    }),

    s("go", {
        t("go func() {"),
        t({ "", "\t" }), i(0),
        t({ "", "}()" }),
    }),

    s("defer", {
        t("defer "), i(0),
    }),

    s("pf", {
        t("fmt.Printf(\""), i(1, "%v"), t("\\n\", "), i(0), t(")"),
    }),

    s("pl", {
        t("fmt.Println("), i(0), t(")"),
    }),

    s("err", {
        t("errors.New(\""), i(0), t("\")"),
    }),

    s("errf", {
        t("fmt.Errorf(\""), i(1), t("\", "), i(0), t(")"),
    }),
}
