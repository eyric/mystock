!
function(e) {
	"use strict";
	var n = function(e, t) {
			return n["string" == typeof t ? "compile" : "render"].apply(n, arguments)
		};
	n.version = "2.0.3", n.openTag = "<%", n.closeTag = "%>", n.isEscape = !0, n.isCompress = !1, n.parser = null, n.render = function(e, t) {
		var r = n.get(e) || o({
			id: e,
			name: "Render Error",
			message: "No Template"
		});
		return r(t)
	}, n.compile = function(e, r) {
		function a(t) {
			try {
				return new s(t, e) + ""
			} catch (i) {
				return u ? o(i)() : n.compile(e, r, !0)(t)
			}
		}
		var c = arguments,
			u = c[2],
			l = "anonymous";
		"string" != typeof r && (u = c[1], r = c[0], e = l);
		try {
			var s = i(e, r, u)
		} catch (p) {
			return p.id = e || r, p.name = "Syntax Error", o(p)
		}
		return a.prototype = s.prototype, a.toString = function() {
			return s.toString()
		}, e !== l && (t[e] = a), a
	};
	var t = n.cache = {},
		r = n.helpers = function() {
			var e = function(n, t) {
					return "string" != typeof n && (t = typeof n, "number" === t ? n += "" : n = "function" === t ? e(n.call(n)) : ""), n
				},
				t = {
					"<": "&#60;",
					">": "&#62;",
					'"': "&#34;",
					"'": "&#39;",
					"&": "&#38;"
				},
				r = function(n) {
					return e(n).replace(/&(?![\w#]+;)|[<>"']/g, function(e) {
						return t[e]
					})
				},
				o = Array.isArray ||
			function(e) {
				return "[object Array]" === {}.toString.call(e)
			}, i = function(e, n) {
				if (o(e)) for (var t = 0, r = e.length; r > t; t++) n.call(e, e[t], t, e);
				else for (t in e) n.call(e, e[t], t)
			};
			return {
				$include: n.render,
				$string: e,
				$escape: r,
				$each: i
			}
		}();
	n.helper = function(e, n) {
		r[e] = n
	}, n.onerror = function(n) {
		var t = "Template Error\n\n";
		for (var r in n) t += "<" + r + ">\n" + n[r] + "\n\n";
		e.console && console.error(t)
	}, n.get = function(r) {
		var o;
		if (t.hasOwnProperty(r)) o = t[r];
		else if ("document" in e) {
			var i = document.getElementById(r);
			if (i) {
				var a = i.value || i.innerHTML;
				o = n.compile(r, a.replace(/^\s*|\s*$/g, ""))
			}
		}
		return o
	};
	var o = function(e) {
			return n.onerror(e), function() {
				return "{Template Error}"
			}
		},
		i = function() {
			var e = r.$each,
				t = "break,case,catch,continue,debugger,default,delete,do,else,false,finally,for,function,if,in,instanceof,new,null,return,switch,this,throw,true,try,typeof,var,void,while,with,abstract,boolean,byte,char,class,const,double,enum,export,extends,final,float,goto,implements,import,int,interface,long,native,package,private,protected,public,short,static,super,synchronized,throws,transient,volatile,arguments,let,yield,undefined",
				o = /\/\*[\w\W]*?\*\/|\/\/[^\n]*\n|\/\/[^\n]*$|"(?:[^"\\]|\\[\w\W])*"|'(?:[^'\\]|\\[\w\W])*'|[\s\t\n]*\.[\s\t\n]*[$\w\.]+/g,
				i = /[^\w$]+/g,
				a = new RegExp(["\\b" + t.replace(/,/g, "\\b|\\b") + "\\b"].join("|"), "g"),
				c = /^\d[^,]*|,\d[^,]*/g,
				u = /^,+|,+$/g,
				l = function(e) {
					return e.replace(o, "").replace(i, ",").replace(a, "").replace(c, "").replace(u, "").split(/^$|,+/)
				};
			return function(t, o, i) {
				function a(e) {
					return m += e.split(/\n/).length - 1, n.isCompress && (e = e.replace(/[\n\r\t\s]+/g, " ").replace(/<!--.*?-->/g, "")), e && (e = E[1] + p(e) + E[2] + "\n"), e
				}
				function c(e) {
					var t = m;
					if ($ ? e = $(e) : i && (e = e.replace(/\n/g, function() {
						return m++, "$line=" + m + ";"
					})), 0 === e.indexOf("=")) {
						var o = !/^=[=#]/.test(e);
						if (e = e.replace(/^=[=#]?|[\s;]*$/g, ""), o && n.isEscape) {
							var a = e.replace(/\s*\([^\)]+\)/, "");
							r.hasOwnProperty(a) || /^(include|print)$/.test(a) || (e = "$escape(" + e + ")")
						} else e = "$string(" + e + ")";
						e = E[1] + e + E[2]
					}
					return i && (e = "$line=" + t + ";" + e), u(e), e + "\n"
				}
				function u(n) {
					n = l(n), e(n, function(e) {
						y.hasOwnProperty(e) || (s(e), y[e] = !0)
					})
				}
				function s(e) {
					var n;
					"print" === e ? n = T : "include" === e ? (v.$include = r.$include, n = O) : (n = "$data." + e, r.hasOwnProperty(e) && (v[e] = r[e], n = 0 === e.indexOf("$") ? "$helpers." + e : n + "===undefined?$helpers." + e + ":" + n)), w += e + "=" + n + ","
				}
				function p(e) {
					return "'" + e.replace(/('|\\)/g, "\\$1").replace(/\r/g, "\\r").replace(/\n/g, "\\n") + "'"
				}
				var f = n.openTag,
					d = n.closeTag,
					$ = n.parser,
					g = o,
					h = "",
					m = 1,
					y = {
						$data: 1,
						$id: 1,
						$helpers: 1,
						$out: 1,
						$line: 1
					},
					v = {},
					w = "var $helpers=this," + (i ? "$line=0," : ""),
					b = "".trim,
					E = b ? ["$out='';", "$out+=", ";", "$out"] : ["$out=[];", "$out.push(", ");", "$out.join('')"],
					x = b ? "if(content!==undefined){$out+=content;return content;}" : "$out.push(content);",
					T = "function(content){" + x + "}",
					O = "function(id,data){data=data||$data;var content=$helpers.$include(id,data,$id);" + x + "}";
				e(g.split(f), function(e) {
					e = e.split(d);
					var n = e[0],
						t = e[1];
					1 === e.length ? h += a(n) : (h += c(n), t && (h += a(t)))
				}), g = h, i && (g = "try{" + g + "}catch(e){" + "throw {" + "id:$id," + "name:'Render Error'," + "message:e.message," + "line:$line," + "source:" + p(o) + ".split(/\\n/)[$line-1].replace(/^[\\s\\t]+/,'')" + "};" + "}"), g = w + E[0] + g + "return new String(" + E[3] + ");";
				try {
					var S = new Function("$data", "$id", g);
					return S.prototype = v, S
				} catch (P) {
					throw P.temp = "function anonymous($data,$id) {" + g + "}", P
				}
			}
		}();
	"function" == typeof define ? define(function() {
		return n
	}) : "undefined" != typeof exports && (module.exports = n), e.template = n
}(this);