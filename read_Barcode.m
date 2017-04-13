function numbers = read_Barcode(motor,sensor,speed,interval)
	
	motor.Speed=speed;
	while(strcmp(readColor(sensor),'black'))
		start(motor)
	end
	
	while(~strcmp(readColor(sensor),'black'))
		start(motor)
	end

	while(strcmp(readColor(sensor),'black'))
		start(motor)
	end

	stop(motor,1);
	pause(1.5);
	resetRotation(motor);
	start(motor);

	b_read = false;
	points=[];
	while(readRotation(motor)<interval*8)
		if(strcmp(readColor(sensor),'black')&&b_read==false)
			b_read=true;
			points = [points readRotation(motor)];
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
