local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("fn", {
        t("function "), i(1, "name"), t("("), i(2), t(") {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("afn", {
        t("async function "), i(1, "name"), t("("), i(2), t(") {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("arr", {
        t("("), i(1), t(") => "), i(0),
    }),

    s("arrb", {
        t("("), i(1), t(") => {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("if", {
        t("if ("), i(1, "condition"), t(") {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("ife", {
        t("if ("), i(1, "condition"), t(") {"),
        t({ "", "\t" }), i(2),
        t({ "", "} else {", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("for", {
        t("for (let "), i(1, "i"), t(" = 0; "), i(2, "i"), t(" < "), i(3, "length"), t("; "), i(4, "i"), t("++) {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("forof", {
        t("for (const "), i(1, "item"), t(" of "), i(2, "items"), t(") {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("forin", {
        t("for (const "), i(1, "key"), t(" in "), i(2, "obj"), t(") {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("try", {
        t("try {"),
        t({ "", "\t" }), i(1),
        t({ "", "} catch (" }), i(2, "err"), t(") {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" }),
    }),

    s("cl", {
        t("console.log("), i(0), t(")"),
    }),

    s("ce", {
        t("console.error("), i(0), t(")"),
    }),

    s("const", {
        t("const "), i(1, "name"), t(" = "), i(0),
    }),

    s("let", {
        t("let "), i(1, "name"), t(" = "), i(0),
    }),

    s("imp", {
        t("import "), i(1, "module"), t(" from \""), i(2, "package"), t("\""),
    }),

    s("impd", {
        t("import { "), i(1), t(" } from \""), i(2, "package"), t("\""),
    }),

    s("exp", {
        t("export "), i(0),
    }),

    s("expd", {
        t("export default "), i(0),
    }),

    s("prom", {
        t("new Promise((resolve, reject) => {"),
        t({ "", "\t" }), i(0),
        t({ "", "})" }),
    }),

    s("then", {
        t(".then(("), i(1, "res"), t(") => "), i(0), t(")"),
    }),

    s("catch", {
        t(".catch(("), i(1, "err"), t(") => "), i(0), t(")"),
    }),
}
