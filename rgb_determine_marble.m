function type = rgb_determine_marble(sensor)
	A=readColorRGB(sensor);
	r=A(1);
	g=A(2);
	b=A(3);
	
	type='null';
	if(r>30&&r<60&&g>30&&g<30&&b>30&&b<60)
		type = 'small red glass';
	end

	if(r>30&&r<60&&g>30&&g<30&&b>30&&b<60)
		type = 'small blue glass';
	end

	if(r>30&&r<60&&g>30&&g<30&&b>30&&b<60)
		type = 'small yellow glass';
	end

	if(r>30&&r<60&&g>30&&g<30&&b>30&&b<60)
		type = 'steel';
	end

	if(r>30&&r<60&&g>30&&g<30&&b>30&&b<60)
		type = 'large red glass';
	end

	if(r>30&&r<60&&g>30&&g<30&&b>30&&b<60)
		type = 'large blue glass';
	end

	if(r>30&&r<60&&g>30&&g<30&&b>30&&b<60)
		type = 'large yellow glass';
	end

	if(r>30&&r<60&&g>30&&g<30&&b>30&&b<60)
		type = 'hdpe';
	end





	%a lot of ifs
end
