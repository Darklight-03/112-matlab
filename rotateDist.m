function b = rotateDist(motor,dist,speed,exact)
	motor.Speed=speed;
	resetRotation(motor);
	while(abs(readRotation(motor))<dist)
		start(motor);
	end
	stop(motor,1);
	if(exact==true)
		motor.Speed=-15;
		while(abs(readRotation(motor)>dist))
			start(motor);
		end
		stop(motor,1);
	end
	b=true;
end
	
