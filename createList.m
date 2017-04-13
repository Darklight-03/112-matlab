function list = createList(binary)
	mat = 'null';
	pt1=binary(2:4);
	pt2=binary(5:9);
	if(isequal(pt1,[0 0 1]))
		mat = 'white glass';
	elseif (isequal(pt1,[0 1 0]))
			mat = 'red glass';
	elseif (isequal(pt1,[1 0 0 ]))
			mat = 'steel/hdpe';
	elseif (isequal(pt1,[0 1 1]))
			mat = 'blue glass';
	end
	pt2d=bi2de(pt2);
	type1=mod((pt2d-1),4);
	type2=floor((pt2d-1)/4);

	map = containers.Map;
end
