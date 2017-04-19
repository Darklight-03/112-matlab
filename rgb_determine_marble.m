function type = rgb_determine_marble(sensor)
	[r, g, b]=readRGBColor(sensor);
	
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
