function type = rgb_determine_marble(sensor)
	Ar=[];
	Ag=[];
	Ab=[];

	for i = 1:420
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
	fprintf('ravg = %.2f gavg = %.2f bavg = %.2f\n',r,g,b);
	bluesmall = [25    30    21    27    13    19];	
	bluelarge = [23    27    20    24    14    18];
	redsmall = [32   36   19    23    12    17];
	redlarge = [32    34    16    18    10    12];
	whitesmall = [41    43    43    44    20    21];
	whitelarge = [50    57    57    65    21    25];
	hdpe = [33    39    31    38    14    20];
	steel = [29    34    26    32    14    16];
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

	fprintf('type=%s\n',type);



	%a lot of ifs
end
