all:
	ocamlfind ocamlc -c -package gen_js_api mylib.mli
	ocamlfind gen_js_api/gen_js_api mylib.mli
	ocamlfind ocamlc -c -package gen_js_api mylib.ml
	ocamlfind ocamlc -c test.ml
	ocamlfind ocamlc -no-check-prims -linkpkg -package gen_js_api mylib.cmo test.cmo -o test.byte
	js_of_ocaml --pretty -o test.js +gen_js_api/ojs_runtime.js test.byte

clean:
	rm -f *.cmi
	rm -f *.cmo
	rm -f test.byte
	rm -f mylib.ml
