function type = rgb_determine_marble(sensor)
	Ar=[];
	Ag=[];
	Ab=[];
    refL=[];
    ambL=[];
   
	for i = 1:42
        
		A=readColorRGB(sensor);
        ambL(end+1) = readLightIntensity(sensor,'ambient');
		refL(end+1) = readLightIntensity(sensor,'reflected');
        Ar(end+1)=A(1);
		Ag(end+1)=A(2);
		Ab(end+1)=A(3);
    end
    totR=[sum(refL)];
    avgR=totR./length(refL);
    sumRefA=[sum(ambL)];
    refavg=sumRefA./length(ambL);
	tot = [sum(Ar) sum(Ag) sum(Ab)];
	avg = tot./length(Ar);
	r=avg(1);
	g=avg(2);
	b=avg(3);
	fprintf('ravg = %.2f gavg = %.2f bavg = %.2f\n',r,g,b);
	bluesmall = [25    34    21    29    13    22];	%28.8643   24.5738   17.5595
	bluelarge = [23    31    20    28    14    21];% 26.6190   23.8905   17.6810
	redsmall = [30    39    15    25    10    18 9.5 10.5];
	redlarge = [30    39    15    23    10    18 8.5 9.5]; %
	whitesmall = [42    44    42    45    21    23 10.5 11.5];
	whitelarge = [54    57    62    64    22    25 13.5 14.5];
	hdpe = [37    39    34    36    17    20 8.5 9.5];
	steel = [33    34    29    31    16    18 7.5 8.5]; %
	type='null';
    
    if(avgR >= hdpe(7) && avgR<=hdpe(8))
		type = 'hdpe';
    end
	
	

	if(avgR >= whitelarge(7) && avgR<=whitelarge(8))
		type = 'large white glass';
	end

	
    
    if(avgR >= whitesmall(7) && avgR<=whitesmall(8))
		type = 'small white glass';
	end

	if(avgR >= steel(7) && avgR<=steel(8))
		type = 'steel';
    end
    
    

	if(r>=bluesmall(1)&&r<=bluesmall(2)&&g>=bluesmall(3)&&g<=bluesmall(4)&&b>=bluesmall(5)&&b<=bluesmall(6))
		type = 'small blue glass';
	end


	if(refavg >= redlarge(7)&&refavg<=redlarge(8)&&r>=redlarge(1)&&r<=redlarge(2)&&g>=redlarge(3)&&g<=redlarge(4)&&b>=redlarge(5)&&b<=redlarge(6))
		type = 'large red glass';
    end
    
    if(refavg >= redsmall(7)&&refavg<=redsmall(8)&&r>=redsmall(1)&&r<=redsmall(2)&&g>=redsmall(3)&&g<=redsmall(4)&&b>=redsmall(5)&&b<=redsmall(6))
		type = 'small red glass';
	end

	if(r>=bluelarge(1)&&r<=bluelarge(2)&&g>=bluelarge(3)&&g<=bluelarge(4)&&b>=bluelarge(5)&&b<=bluelarge(6))
		type = 'large blue glass';
	end
    

	fprintf('type=%s\n',type);



	%a lot of ifs
end
