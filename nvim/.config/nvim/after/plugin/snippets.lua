ls = require("luasnip")
ls.add_snippets("tex",{
    ls.snippet("vector",{
        ls.text_node("\\begin{pmatrix}"),
        ls.insert_node(1),
        ls.text_node("\\"),
        ls.insert_node(1),
        ls.text_node("\\"),
        ls.insert_node(1),
        ls.text_node("\\"),
        ls.text_node("\\end{pmatrix}"),
    })
})
