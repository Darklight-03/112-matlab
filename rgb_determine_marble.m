function type = rgb_determine_marble(sensor)
	[r, g, b]=readRGBColor(sensor);
	
	if(r>30&&r<60&&g>30&&g<30&&b>30&&b<60)
		type = 'test';
	end
	%a lot of ifs
end
