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
	pt2d=binaryVectorToDecimal(pt2);
	type1=mod((pt2d-1),4);
	type2=floor((pt2d-1)/4);
	if(~strcmp(mat,'steel/hdpe'))
		mat1 = strcat('large ',mat);
		mat2 = strcat('small ',mat);
	else
		mat1 = 'steel';
		mat2 = 'hdpe';
	end

	map = containers.Map([mat1 mat2],[type1 type2]);
	list = map;	
end
