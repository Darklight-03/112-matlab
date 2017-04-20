function type = rgb_determine_marble(sensor)
	Ar=[];
	Ag=[];
	Ab=[];

	for i = 1:42
		A=readColorRGB(sensor);
		Ar(end+1)=A(1);
		Ag(end+1)=A(2);
		Ab(end+1)=A(3);
	end
	tot = [sum(Ar) sum(Ag) sum(Ab)];
	avg = tot./length(Ar);
	r=avg(1);
	g=avg(2);
	b=avg(3);
	bluesmall = [30 33 29 32 18 20];	
	bluelarge = [28 30 28 31 20 22];
	redsmall = [35 37 29 31 14 17];
	redlarge = [35 37 25 28 11 14];
	whitesmall = [42 44 37 38 25 26];
	whitelarge = [57 58 52 53 35 37];
	hdpe = [39 41 35 36 22 23];
	steel = [33 34 30 32 16 18];
	type='null';
	if(r>=redsmall(1)&&r<=redsmall(2)&&g>=redsmall(3)&&g<=redsmall(4)&&b>=redsmall(5)&&b<=redsmall(6))
		type = 'small red glass';
	end

	if(r>=bluesmall(1)&&r<=bluesmall(2)&&g>=bluesmall(3)&&g<=bluesmall(4)&&b>=bluesmall(5)&&b<=bluesmall(6))
		type = 'small blue glass';
	end

	if(r>=whitesmall(1)&&r<=whitesmall(2)&&g>=whitesmall(3)&&g<=whitesmall(4)&&b>=whitesmall(5)&&b<=whitesmall(6))
		type = 'small white glass';
	end

	if(r>=steel(1)&&r<=steel(2)&&g>=steel(3)&&g<=steel(4)&&b>=steel(5)&&b<=steel(6))
		type = 'steel';
	end

	if(r>=redlarge(1)&&r<=redlarge(2)&&g>=redlarge(3)&&g<=redlarge(4)&&b>=redlarge(5)&&b<=redlarge(6))
		type = 'large red glass';
	end

	if(r>=bluelarge(1)&&r<=bluelarge(2)&&g>=bluelarge(3)&&g<=bluelarge(4)&&b>=bluelarge(5)&&b<=bluelarge(6))
		type = 'large blue glass';
	end

	if(r>=whitelarge(1)&&r<=whitelarge(2)&&g>=whitelarge(3)&&g<=whitelarge(4)&&b>=whitelarge(5)&&b<=whitelarge(6))
		type = 'large white glass';
	end

	if(r>=hdpe(1)&&r<=hdpe(2)&&g>=hdpe(3)&&g<=hdpe(4)&&b>=hdpe(5)&&b<=hdpe(6))
		type = 'hdpe';
	end





	%a lot of ifs
end
