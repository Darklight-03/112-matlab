function numbers = read_Barcode(motor,sensor,speed,interval)
	
	readColor(sensor);
	motor.Speed=speed;
	
	wait=true;
	start(motor)
	while(wait==true)
		if(strcmp(readColor(sensor),'black'))
			pause(.25);
			if(strcmp(readColor(sensor),'black'))
				wait=false;
			end
		end
	end

	stop(motor,1);
	pause(1.5);
	resetRotation(motor);
	start(motor);

	b_read = false;
	points=[];
	while(readRotation(motor)<interval*8)
		if(strcmp(readColor(sensor),'black')&&b_read==false)
			pause(.1);
			if(strcmp(readColor(sensor),'black')&&b_read==false)
				b_read=true;
				points = [points readRotation(motor)];
			end
		end
		if(~strcmp(readColor(sensor),'black'))
			b_read=false;
		end
	end
	stop(motor,1);
	points = round(points./interval)+1;
	
	points = [1 points];
	
	binary = zeros(1,9);
	
	for i = 1:max(size(points))
		binary(points(i))=1;
	end
	numbers = binary;
end
