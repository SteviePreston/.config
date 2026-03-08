local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("fn", {
        t("fn "), i(1, "name"), t("("), i(2), t(") "), i(3), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("pfn", {
        t("pub fn "), i(1, "name"), t("("), i(2), t(") "), i(3), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("afn", {
        t("async fn "), i(1, "name"), t("("), i(2), t(") "), i(3), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("main", {
        t({ "fn main() {", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("test", {
        t({ "#[test]", "fn " }), i(1, "test_name"), t("() {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
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

    s("ifl", {
        t("if let "), i(1, "Some(x)"), t(" = "), i(2, "expr"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("match", {
        t("match "), i(1, "expr"), t(" {"),
        t({ "", "\t" }), i(2, "pattern"), t(" => "), i(0),
        t({ "", "}" }),
    }),

    s("for", {
        t("for "), i(1, "item"), t(" in "), i(2, "iter"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("while", {
        t("while "), i(1, "condition"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("loop", {
        t("loop {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("struct", {
        t("struct "), i(1, "Name"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("pstruct", {
        t("pub struct "), i(1, "Name"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("enum", {
        t("enum "), i(1, "Name"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("impl", {
        t("impl "), i(1, "Type"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("implt", {
        t("impl "), i(1, "Trait"), t(" for "), i(2, "Type"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("trait", {
        t("trait "), i(1, "Name"), t(" {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("mod", {
        t("mod "), i(0, "name"), t(";"),
    }),

    s("use", {
        t("use "), i(0), t(";"),
    }),

    s("der", {
        t("#[derive("), i(0, "Debug, Clone"), t(")]"),
    }),

    s("pl", {
        t("println!(\""), i(1, "{}"), t("\", "), i(0), t(");"),
    }),

    s("pr", {
        t("print!(\""), i(1, "{}"), t("\", "), i(0), t(");"),
    }),

    s("vec", {
        t("vec!["), i(0), t("]"),
    }),

    s("ok", {
        t("Ok("), i(0), t(")"),
    }),

    s("err", {
        t("Err("), i(0), t(")"),
    }),

    s("some", {
        t("Some("), i(0), t(")"),
    }),

    s("res", {
        t("Result<"), i(1, "T"), t(", "), i(0, "E"), t(">"),
    }),

    s("opt", {
        t("Option<"), i(0, "T"), t(">"),
    }),

    s("cfg", {
        t("#[cfg("), i(0, "test"), t(")]"),
    }),
}
