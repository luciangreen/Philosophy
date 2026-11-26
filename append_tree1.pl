%a([a,b,c],[a,c],V10).
a(V1,V2,V10):-

	get_item_n(V2,1,V3),
	get_item_n(V2,2,V4),
	append(V5,V6,V1),
	append([V3],V7,V6),
	append(V10,V8,V7),
	append([V4],V9,V8).
